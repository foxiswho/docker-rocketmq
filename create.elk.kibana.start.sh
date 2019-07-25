#!/usr/bin/env bash

DIR=$(cd $(dirname $0); pwd)


kubectl create -f  ${DIR}/kibana/service.yml
kubectl create -f  ${DIR}/kibana/pod.yml

kubectl get pod

echo -e "\n\n\n"

echo " success"




