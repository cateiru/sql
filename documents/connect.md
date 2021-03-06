# SQLに接続する

## TOC

- Config and Environments
- RUN
- Connection DB

### Config and Environments

- `.env`にCLOUDSQL_INSTANCE_CONNECTION_NAMEを追加する

  ```bash
  toruch .env

  # CloudSQLの接続名
  echo "CLOUDSQL_INSTANCE_CONNECTION_NAME=[Your cloudsql instance connection name]" > .env

  # mysql user
  echo "MYSQL_USER=[mysql user]" >> .env

  # mysql password
  echo "MYSQL_PASSWORD=[mysql password]" >> .env
  ```

- `config/sa_key.json`を追加する
  - Cloud IAMからサービスアカウントを作成し、GCPサービスアカウントキーを追加する

### RUN

```bash
docker-compose up
```

### Connection DB

```bash
./scripts/sql.sh
```
