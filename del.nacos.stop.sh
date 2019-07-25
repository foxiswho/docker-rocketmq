#!/usr/bin/env bash

DIR=$(cd $(dirname $0); pwd)

echo "kubectl delete "

kubectl delete -f  ${DIR}/nacos/service.yml
kubectl delete -f  ${DIR}/nacos/pod.yml
kubectl delete -f  ${DIR}/nacos/cm.yml


kubectl get pod

echo -e "\n\n\n"

echo "success"




