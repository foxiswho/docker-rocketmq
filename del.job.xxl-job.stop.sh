#!/usr/bin/env bash

DIR=$(cd $(dirname $0); pwd)

echo "kubectl delete "


kubectl delete -f  ${DIR}/job-xxl-job/pod.yml
kubectl delete -f  ${DIR}/job-xxl-job/service.yml
kubectl delete -f  ${DIR}/job-xxl-job/cm.yml

kubectl get pod

echo -e "\n\n\n"

echo "success"




