#!/usr/bin/env bash

DIR=$(cd $(dirname $0); pwd)

echo "kubectl delete "

rm -rf  ${DIR}/elasticsearch/logs/*
rm -rf  ${DIR}/elasticsearch/data/*

kubectl delete -f  ${DIR}/elasticsearch/service.yml
kubectl delete -f  ${DIR}/elasticsearch/pod.yml

kubectl get pod

echo -e "\n\n\n"

echo "success"




