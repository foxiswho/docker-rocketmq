#!/usr/bin/env bash

DIR=$(pwd)

echo "kubectl delete "

kubectl delete -f  ${DIR}/prometheus/prometheus-service.yml
kubectl delete -f  ${DIR}/prometheus/prometheus-rc.yml


kubectl get pod

echo -e "\n\n\n"

echo "success"




