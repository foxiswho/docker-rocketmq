#!/usr/bin/env bash

DIR=$(cd $(dirname $0); pwd)

echo "kubectl delete "

rm -rf ${DIR}/sentinel/logs


kubectl delete -f  ${DIR}/sentinel/sentinel-service.yml
kubectl delete -f  ${DIR}/sentinel/sentinel-rc.yml
kubectl delete -f  ${DIR}/sentinel/sentinel-cm.yml

kubectl get pod

echo -e "\n\n\n"

echo "success"




