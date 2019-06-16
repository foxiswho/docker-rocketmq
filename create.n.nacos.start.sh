#!/usr/bin/env bash

DIR=$(pwd)


mkdir -p     ${DIR}/nacos/logs-nacos
chmod -R 777 ${DIR}/nacos/logs-nacos



kubectl create -f  ${DIR}/nacos/nacos-service.yml
kubectl create -f  ${DIR}/nacos/nacos-rc.yml

kubectl get pod

echo -e "\n\n\n"

echo "success"




