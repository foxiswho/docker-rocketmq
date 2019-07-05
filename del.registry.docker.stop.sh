#!/usr/bin/env bash

DIR=$(cd $(dirname $0); pwd)

echo "kubectl delete "


kubectl delete -f  ${DIR}/registry-docker/registry-service.yml
kubectl delete -f  ${DIR}/registry-docker/registry-rc.yml

kubectl delete -f  ${DIR}/registry-docker/ui-service.yml
kubectl delete -f  ${DIR}/registry-docker/ui-rc.yml

kubectl get pod

echo -e "\n\n\n"

echo "success"




