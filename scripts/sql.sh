#!/bin/bash

source ./.env

mysql -h 127.0.0.1 -u $MYSQL_USER -p$MYSQL_PASSWORD
