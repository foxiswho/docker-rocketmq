#!/usr/bin/env bash

DIR=$(pwd)

echo "kubectl delete "

kubectl delete -f  ${DIR}/zipkin/zipkin-service.yml
kubectl delete -f  ${DIR}/zipkin/zipkin-rc.yml


kubectl get pod

echo -e "\n\n\n"

echo "success"




