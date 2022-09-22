// マイグレーション用のDSLを自動で生成するスクリプト
package main

import (
	"bytes"
	"errors"
	"flag"
	"fmt"
	"log"
	"os"
	"os/exec"
	"path/filepath"
	"strings"

	"github.com/schemalex/schemalex/diff"
)

var TmpDirName string = ".before_scheme"
var TargetDirName string = "schema"

func main() {
	flag.Parse()
	migrateName := flag.Arg(0)
	if migrateName == "" {
		log.Fatal("migration name is failed\nusage:\n\tgo run . [migration name]\n\n")
	}

	tmpDir, err := filepath.Abs(TmpDirName)
	if err != nil {
		log.Fatal(err)
	}
	targetDir, err := filepath.Abs(TargetDirName)
	if err != nil {
		log.Fatal(err)
	}
	files, err := os.ReadDir(targetDir)
	if err != nil {
		log.Fatal(err)
	}
	for _, file := range files {
		if !file.IsDir() {
			path := filepath.Join(targetDir, file.Name())
			err := Execute(path, tmpDir, migrateName)
			if err != nil {
				log.Fatal(err)
			}
		}
	}

}

// path: `./scheme`のファイルパス
// tmpDir: スキーマの一時保存のフルパス
func Execute(path string, tmpDir string, migrateName string) error {
	if _, err := os.Stat(path); err != nil {
		return errors.New("file not exists")
	}

	fileName := filepath.Base(path)
	tmpPath := filepath.Join(tmpDir, fileName)
	tmpBody, err := ReadTmpFile(tmpPath)
	if err != nil {
		return err
	}
	targetBin, err := os.ReadFile(path)
	if err != nil {
		return err
	}
	targetBody := string(targetBin)

	diffBody, err := Diff(tmpBody, targetBody)
	if err != nil {
		return err
	}

	// 差分がない場合はなにもしない
	if diffBody == "" {
		fmt.Printf("%s: is no diff\n", fileName)
		return nil
	}

	if err := SaveTmp(tmpPath, targetBody); err != nil {
		return err
	}

	name := filepath.Base(path[:len(path)-len(filepath.Ext(path))])
	if err := CreateMigration(name, diffBody, migrateName); err != nil {
		return err
	}

	fmt.Printf("%s: Success export diff!\n", fileName)

	return nil
}

// tmpのファイルを読み込む
// もしファイルが存在しない場合は作成する
func ReadTmpFile(tmpPath string) (string, error) {
	tmpBody := ""
	// tmpにファイルが存在しない場合、作成する
	if _, err := os.Stat(tmpPath); err != nil {
		_, err := os.Create(tmpPath)
		if err != nil {
			return "", err
		}
		return tmpBody, nil
	}

	body, err := os.ReadFile(tmpPath)
	if err != nil {
		return "", err
	}
	tmpBody = string(body)

	return tmpBody, nil
}

func SaveTmp(tmpPath string, body string) error {
	return os.WriteFile(tmpPath, []byte(body), 0664)
}

func Diff(current string, target string) (string, error) {
	var buff bytes.Buffer

	if err := diff.Strings(&buff, current, target, diff.WithTransaction(false)); err != nil {
		return "", err
	}

	return buff.String(), nil
}

func CreateMigration(filename string, diffBody string, migrateName string) error {
	cmd := exec.Command("migrate", "create", "-ext", "sql", "-dir", fmt.Sprintf("./db/%s", filename), migrateName)
	var stderr bytes.Buffer
	cmd.Stderr = &stderr
	err := cmd.Run()
	if err != nil {
		return err
	}

	// len.0: up, len.1: down
	exportFiles := strings.Split(stderr.String(), "\n")

	return os.WriteFile(exportFiles[0], []byte(diffBody), 0664)
}
