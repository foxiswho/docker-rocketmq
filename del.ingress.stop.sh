#!/usr/bin/env bash

DIR=$(cd $(dirname $0); pwd)

echo "kubectl delete "


kubectl delete -f  ${DIR}/ingress-nginx/mandatory.yml
kubectl delete -f  ${DIR}/ingress-nginx/test-ingress.yml
kubectl delete -f  ${DIR}/ingress-nginx/test-nginx.yml

kubectl get pod

echo -e "\n\n\n"

echo "success"




