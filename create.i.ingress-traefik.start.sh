#!/usr/bin/env bash

DIR=$(cd $(dirname $0); pwd)


#mkdir -p        ${DIR}/redis/data
#chmod -R 777    ${DIR}/redis/data

kubectl create -f  ${DIR}/ingress-traefik/traefik-rbac.yml
kubectl create -f  ${DIR}/ingress-traefik/traefik-sa.yml
kubectl create -f  ${DIR}/ingress-traefik/traefik-ds-service.yml
kubectl create -f  ${DIR}/ingress-traefik/traefik-ds-master.yml
kubectl create -f  ${DIR}/ingress-traefik/test-nginx.yml
kubectl create -f  ${DIR}/ingress-traefik/ingress.yml
kubectl create -f  ${DIR}/ingress-traefik/ingress-service.yml

kubectl get pod

echo -e "\n\n\n"

echo " success"




