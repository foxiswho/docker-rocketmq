#!/usr/bin/env bash

DIR=$(pwd)


kubectl create -f  ${DIR}/prometheus/prometheus-service.yml
kubectl create -f  ${DIR}/prometheus/prometheus-rc.yml

kubectl get pod

echo -e "\n\n\n"

echo " success"




