#!/usr/bin/env bash

DIR=$(cd $(dirname $0); pwd)

echo "kubectl delete "




kubectl delete -f  ${DIR}/ingress-traefik/traefik-rbac.yml
kubectl delete -f  ${DIR}/ingress-traefik/traefik-sa.yml
kubectl delete -f  ${DIR}/ingress-traefik/traefik-ds-service.yml
kubectl delete -f  ${DIR}/ingress-traefik/traefik-ds-master.yml
kubectl delete -f  ${DIR}/ingress-traefik/test-nginx.yml
kubectl delete -f  ${DIR}/ingress-traefik/ingress.yml
kubectl delete -f  ${DIR}/ingress-traefik/ingress-service.yml

kubectl get pod

echo -e "\n\n\n"

echo "success"




