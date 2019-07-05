#!/usr/bin/env bash

DIR=$(cd $(dirname $0); pwd)

echo "k8s   一键快速 部署"
echo " "
echo " "
echo "k8s   一键快速 部署 开发环境 By fox"
echo " "
echo " "
echo "mariadb       开始部署"
echo " "
. ${DIR}/create.b.mariadb.start.sh

echo "mariadb       部署完成"

echo "redis         开始部署"
echo " "
sleep 3s


. ${DIR}/create.r.redis.start.sh

echo "redis         部署完成"

echo "nacos         开始部署"
echo " "
sleep 3s

. ${DIR}/create.n.nacos.start.sh

echo "nacos         部署完成"

echo "rocketmq         开始部署"
echo " "
sleep 3s

. ${DIR}/create.r.rocketmq.start.sh

echo "rocketmq         部署完成"

echo "elasticsearch         开始部署"
echo " "
sleep 3s

. ${DIR}/create.elk.elasticsearch.start.sh

echo "elasticsearch         部署完成"

echo "kibana         开始部署"
echo " "
sleep 3s

. ${DIR}/create.elk.kibana.start.sh

echo "kibana         部署完成"

echo "sentinel         开始部署"
echo " "
sleep 3s

. ${DIR}/create.s.sentinel.start.sh

echo "sentinel         部署完成"

echo "zipkin         开始部署"
echo " "
sleep 3s

. ${DIR}/create.z.zipkin.start.sh

echo "zipkin         部署完成"

echo "grafana         开始部署"
echo " "
sleep 3s

. ${DIR}/create.g.grafana.start.sh

echo "grafana         部署完成"

echo "prometheus         开始部署"
echo " "
sleep 3s

. ${DIR}/create.p.prometheus.start.sh


echo "prometheus         部署完成"



echo " "
echo " "
echo "k8s   一键快速 部署 开发环境 By fox"
echo " "
echo " "
echo "部署完成"
echo "部署完成"
echo "部署完成"
echo "部署完成"
echo "部署完成"
