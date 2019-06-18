#!/usr/bin/env bash

DIR=$(pwd)

echo "kubectl delete "


kubectl delete -f  ${DIR}/registry-docker/registry-service.yml
kubectl delete -f  ${DIR}/registry-docker/registry-rc.yml

kubectl get pod

echo -e "\n\n\n"

echo "success"




