#!/usr/bin/env bash

DIR=$(cd $(dirname $0); pwd)

mkdir -p        ${DIR}/sentinel/logs
chmod -R 777    ${DIR}/sentinel/logs

kubectl create -f  ${DIR}/sentinel/cm.yml
kubectl create -f  ${DIR}/sentinel/service.yml
kubectl create -f  ${DIR}/sentinel/pod.yml

kubectl get pod

echo -e "\n\n\n"

echo " success"




