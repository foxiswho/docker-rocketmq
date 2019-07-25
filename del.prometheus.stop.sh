#!/usr/bin/env bash

DIR=$(cd $(dirname $0); pwd)

echo "kubectl delete "

kubectl delete -f  ${DIR}/prometheus/service.yml
kubectl delete -f  ${DIR}/prometheus/pod.yml


kubectl get pod

echo -e "\n\n\n"

echo "success"




