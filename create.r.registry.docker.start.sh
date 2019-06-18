#!/usr/bin/env bash

DIR=$(pwd)


mkdir -p        ${DIR}/registry/data
chmod -R 777    ${DIR}/registry/data

kubectl create -f  ${DIR}/registry-docker/registry-service.yml
kubectl create -f  ${DIR}/registry-docker/registry-rc.yml

kubectl get pod

echo -e "\n\n\n"

echo " success"




