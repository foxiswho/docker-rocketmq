#!/usr/bin/env bash

DIR=$(cd $(dirname $0); pwd)


rm -rf /etc/yum.repos.d/mariadb.repo
cat <<EOF > /etc/yum.repos.d/mariadb.repo
[mariadb]
name = MariaDB
baseurl = http://mirrors.aliyun.com/mariadb/yum/10.4/centos7-amd64/
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
enabled=1
gpgcheck=1
EOF

yum clean all
yum makecache
yum repolist


yum install -y MariaDB-client

docker pull mariadb:latest

mkdir -p ${DIR}/mariadb/data
mkdir -p ${DIR}/mariadb/mariadb.conf.d
chmod -R 777 ${DIR}/mariadb/data
chmod -R 777 ${DIR}/mariadb/mariadb.conf.d



kubectl create -f  ${DIR}/mariadb/mariadb-service.yml
kubectl create -f  ${DIR}/mariadb/mariadb-rc.yml

echo "等待 mariadb pod 容器启动成功"
echo "60 秒等待时间"

kubectl get pod
sleep 10s


kubectl get pod

echo "50 秒等待时间"
sleep 10s

kubectl get pod

echo "40 秒等待时间"
sleep 10s

kubectl get pod

echo "30 秒等待时间"
sleep 10s

kubectl get pod

echo "20 秒等待时间"
# 这里的休眠只是让数据库容器 尽快创建成功
sleep 20s

kubectl get pod

echo -e "开始 导入 nacos-mysql.sql 数据"
echo -e "创建 nacos 用户，密码为 nacos"
echo -e "创建 库 nacos_devtest "

# 导入数据库SQL
mysql -h127.0.0.1 -uroot -proot mysql < ${DIR}/mariadb/sql/nacos-mysql.sql

echo -e "\nnacos-mysql.sql 数据导入成功 \n\n\n"

kubectl get pod

echo -e "\n\n\n"

echo "mariadb success"




