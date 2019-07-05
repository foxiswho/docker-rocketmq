#!/usr/bin/env bash

DIR=$(cd $(dirname $0); pwd)

mkdir -p        ${DIR}/elasticsearch/logs
mkdir -p        ${DIR}/elasticsearch/data
mkdir -p        ${DIR}/elasticsearch/plugins/analysis-ik
chmod -R 777    ${DIR}/elasticsearch/logs
chmod -R 777    ${DIR}/elasticsearch/data
chmod -R 777    ${DIR}/elasticsearch/plugins/analysis-ik

kubectl create -f  ${DIR}/elasticsearch/elasticsearch-service.yml
kubectl create -f  ${DIR}/elasticsearch/elasticsearch-rc.yml

kubectl get pod

echo -e "\n\n\n"

echo " success"




