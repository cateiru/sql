# migrate

[migrate/cmd/migrate at master · golang-migrate/migrate](https://github.com/golang-migrate/migrate/tree/master/cmd/migrate)

## INSTALL

### LINUX

```bash
curl -L https://packagecloud.io/golang-migrate/migrate/gpgkey | sudo apt-key add -
echo "deb https://packagecloud.io/golang-migrate/migrate/ubuntu/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/migrate.list
sudo apt-get update
sudo apt-get install -y migrate
```

### MAC

```bash
brew install golang-migrate
```

## CREATE MIGRATE TABLE

```bash
migrate create -ext sql -dir ./db/[table name] [migrate operation name]
```

## MIGRATE

```bash
./scripts/migrations.sh
```
