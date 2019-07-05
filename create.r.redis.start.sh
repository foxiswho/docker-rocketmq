#!/usr/bin/env bash

DIR=$(cd $(dirname $0); pwd)


mkdir -p        ${DIR}/redis/data
chmod -R 777    ${DIR}/redis/data

kubectl create -f  ${DIR}/redis/redis-service.yml
kubectl create -f  ${DIR}/redis/redis-rc.yml

kubectl get pod

echo -e "\n\n\n"

echo " success"




