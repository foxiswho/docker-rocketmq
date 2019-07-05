#!/usr/bin/env bash

DIR=$(cd $(dirname $0); pwd)

echo "kubectl delete "

#rm -rf ${DIR}/mariadb/data

kubectl delete -f  ${DIR}/mariadb/mariadb-service.yml
kubectl delete -f  ${DIR}/mariadb/mariadb-rc.yml


kubectl get pod

echo -e "\n\n\n"

echo "success"




