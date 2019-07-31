#!/usr/bin/env bash

DIR=$(cd $(dirname $0); pwd)


mkdir -p        ${DIR}/job-xxl-job/logs
chmod -R 777    ${DIR}/job-xxl-job/logs

kubectl create -f  ${DIR}/job-xxl-job/cm.yml
kubectl create -f  ${DIR}/job-xxl-job/service.yml
kubectl create -f  ${DIR}/job-xxl-job/pod.yml

kubectl get pod

echo -e "\n\n\n"

echo " success"




