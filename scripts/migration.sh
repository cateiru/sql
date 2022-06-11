#!/bin/bash

FILES="db/*"

source ./.env

for DATABASE_PATH in $FILES; do

  DATABASE=${DATABASE_PATH##*/}
  echo "------- Migration DB: ${DATABASE} -------"

  MYSQL_DSN="mysql://${MYSQL_USER}:${MYSQL_PASSWORD}@tcp(127.0.0.1:3306)/${DATABASE}"

  migrate -path "${DATABASE_PATH}" -database "${MYSQL_DSN}" up

done
