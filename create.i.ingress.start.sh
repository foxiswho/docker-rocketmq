#!/usr/bin/env bash

DIR=$(cd $(dirname $0); pwd)


#mkdir -p        ${DIR}/redis/data
#chmod -R 777    ${DIR}/redis/data

kubectl create -f  ${DIR}/ingress-nginx/mandatory.yml
kubectl create -f  ${DIR}/ingress-nginx/test-ingress.yml
kubectl create -f  ${DIR}/ingress-nginx/test-nginx.yml

kubectl get pod

echo -e "\n\n\n"

echo " success"




