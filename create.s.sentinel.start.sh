#!/usr/bin/env bash

DIR=$(cd $(dirname $0); pwd)

mkdir -p        ${DIR}/sentinel/logs
chmod -R 777    ${DIR}/sentinel/logs

kubectl create -f  ${DIR}/sentinel/sentinel-cm.yml
kubectl create -f  ${DIR}/sentinel/sentinel-service.yml
kubectl create -f  ${DIR}/sentinel/sentinel-rc.yml

kubectl get pod

echo -e "\n\n\n"

echo " success"




