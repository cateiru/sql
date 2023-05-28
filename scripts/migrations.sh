#!/bin/bash

FILES="db/*"

source ./.env

for DATABASE_PATH in $FILES; do
  DATABASE=${DATABASE_PATH##*/}

  mysql -h 127.0.0.1 -u $MYSQL_USER -p$MYSQL_PASSWORD -e "CREATE DATABASE IF NOT EXISTS `${DATABASE}`;"

  echo "------- Migration DB: ${DATABASE} -------"

  MYSQL_DSN="mysql://${MYSQL_USER}:${MYSQL_PASSWORD}@tcp(127.0.0.1:3306)/${DATABASE}"

  migrate -path "${DATABASE_PATH}" -database "${MYSQL_DSN}" up

done
