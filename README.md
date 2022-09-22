# SQL

SQL Migration Repositories

## USAGE

1. Change SQL Schema in `./schema/*.sql`
2. Run `go run . [migration name]`
3. Created migration files!!

## OTHER

```bash
migrate create -ext sql -dir ./db/[table name] [migrate operation name]
```

## USAGE

- [env](./documents/environments.md)
- [Connect DB](./documents/connect.md)
- [migrate](./documents/migrate.md)
- [test](./documents/test.md)
