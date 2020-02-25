#!/usr/bin/env bash

# 创建目录
mkdir -p ./rmqs/logs
mkdir -p ./rmqs/store
mkdir -p ./rmq/logs
mkdir -p ./rmq/store

# 设置目录权限
chmod -R 777 ./rmqs/logs
chmod -R 777 ./rmqs/store
chmod -R 777 ./rmq/logs
chmod -R 777 ./rmq/store

# 下载并启动容器，且为 后台 自动启动
docker-compose up -d


# 显示 rocketmq 容器
docker ps |grep rocketmq