#!/usr/bin/env bash

DIR=$(cd $(dirname $0); pwd)

echo "kubectl delete "

kubectl delete -f  ${DIR}/nacos/nacos-service.yml
kubectl delete -f  ${DIR}/nacos/nacos-rc.yml
kubectl delete -f  ${DIR}/nacos/nacos-cm.yml


kubectl get pod

echo -e "\n\n\n"

echo "success"




