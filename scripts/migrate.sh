#!/bin/bash

source ./.env

MYSQL_DSN="mysql://${MYSQL_USER}:${MYSQL_PASSWORD}@tcp(127.0.0.1:3306)/${OP_DATABASE}"

migrate -database "${MYSQL_DSN}" $@
