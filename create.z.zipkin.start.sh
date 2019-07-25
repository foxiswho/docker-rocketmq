#!/usr/bin/env bash

DIR=$(cd $(dirname $0); pwd)


kubectl create -f  ${DIR}/zipkin/service.yml
kubectl create -f  ${DIR}/zipkin/pod.yml

kubectl get pod

echo -e "\n\n\n"

echo " success"




