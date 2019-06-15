#!/usr/bin/env bash

DIR=$(pwd)

echo "kubectl delete "

kubectl delete -f  ${DIR}/nacos/nacos-service.yml
kubectl delete -f  ${DIR}/nacos/nacos-rc.yml


kubectl get pod

echo -e "\n\n\n"

echo "success"




