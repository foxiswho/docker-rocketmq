#!/usr/bin/env bash

DIR=$(cd $(dirname $0); pwd)


mkdir -p        ${DIR}/logstash/logs
chmod -R 777    ${DIR}/logstash/logs

kubectl create -f  ${DIR}/logstash/service.yml
kubectl create -f  ${DIR}/logstash/pod.yml

kubectl get pod

echo -e "\n\n\n"

echo " success"




