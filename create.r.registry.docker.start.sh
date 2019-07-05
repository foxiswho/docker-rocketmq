#!/usr/bin/env bash

DIR=$(cd $(dirname $0); pwd)


mkdir -p        ${DIR}/registry-docker/data
chmod -R 777    ${DIR}/registry-docker/data

kubectl create -f  ${DIR}/registry-docker/registry-service.yml
kubectl create -f  ${DIR}/registry-docker/registry-rc.yml

kubectl create -f  ${DIR}/registry-docker/ui-service.yml
kubectl create -f  ${DIR}/registry-docker/ui-rc.yml

kubectl get pod

echo -e "\n\n\n"

echo " success"




