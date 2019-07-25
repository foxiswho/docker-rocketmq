#!/usr/bin/env bash

DIR=$(cd $(dirname $0); pwd)


mkdir -p        ${DIR}/jenkins/home
chmod -R 777    ${DIR}/jenkins/home

kubectl create -f  ${DIR}/jenkins/service.yml
kubectl create -f  ${DIR}/jenkins/pod.yml

kubectl get pod

echo -e "\n\n\n"

echo " success"




