#!/bin/bash

rm -rf ./local/data/*

docker-compose -f ./docker-compose-local.yaml up $@
