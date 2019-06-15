#!/usr/bin/env bash

DIR=`pwd`

yum install -y mariadb

docker pull mariadb:latest

mkdir -p ${DIR}/mariadb/data
mkdir -p ${DIR}/mariadb/mariadb.conf.d
chmod -R 777 ${DIR}/mariadb/data
chmod -R 777 ${DIR}/mariadb/mariadb.conf.d



kubectl create -f  ${DIR}/nacos-service.yml
kubectl create -f  ${DIR}/nacos-rc.yml

# 这里的休眠只是让数据库容器 尽快创建成功
sleep 20s

echo "开始 导入 nacos-mysql.sql 数据"
echo "创建 nacos 用户，密码为 nacos"
echo "创建 库 nacos_devtest "

# 导入数据库SQL
mysql -h127.0.01 -uroot -proot < ${DIR}/mariadb/sql/nacos-mysql.sql

echo "\nnacos-mysql.sql 数据导入成功 \n\n\n"


mkdir -p ${DIR}/nacos/logs-nacos



kubectl create -f  ${DIR}/nacos-service.yml
kubectl create -f  ${DIR}/nacos-rc.yml


echo "success"




