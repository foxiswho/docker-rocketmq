#!/usr/bin/env bash


mkdir -p ./rmqs/logs
mkdir -p ./rmqs/store
mkdir -p ./rmq/logs
mkdir -p ./rmq/store

chmod -R 777 ./rmqs/logs
chmod -R 777 ./rmqs/store
chmod -R 777 ./rmq/logs
chmod -R 777 ./rmq/store

docker-compose up -d
