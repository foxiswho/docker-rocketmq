#!/usr/bin/env bash

DIR=$(pwd)

# 和 elasticsearch 版本对应
ELK_VERSION=7.1.1

wget https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v${ELK_VERSION}/elasticsearch-analysis-ik-${ELK_VERSION}.zip -O analysis-ik.zip



mkdir -p        ${DIR}/elasticsearch/logs
mkdir -p        ${DIR}/elasticsearch/data
#mkdir -p        ${DIR}/elasticsearch/plugins/analysis-ik
chmod -R 777    ${DIR}/elasticsearch/logs
chmod -R 777    ${DIR}/elasticsearch/data
#chmod -R 777    ${DIR}/elasticsearch/plugins/analysis-ik

kubectl create -f  ${DIR}/elasticsearch/elasticsearch-service.yml
kubectl create -f  ${DIR}/elasticsearch/elasticsearch-rc.yml

kubectl get pod

echo -e "\n\n\n"

echo " success"




