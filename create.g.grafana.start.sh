#!/usr/bin/env bash

DIR=$(cd $(dirname $0); pwd)


kubectl create -f  ${DIR}/grafana/grafana-service.yml
kubectl create -f  ${DIR}/grafana/grafana-rc.yml

kubectl get pod

echo -e "\n\n\n"

echo " success"




