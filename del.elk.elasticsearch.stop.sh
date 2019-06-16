#!/usr/bin/env bash

DIR=$(pwd)

echo "kubectl delete "

rm -rf  ${DIR}/elasticsearch/logs/*
rm -rf  ${DIR}/elasticsearch/data/*

kubectl delete -f  ${DIR}/elasticsearch/elasticsearch-service.yml
kubectl delete -f  ${DIR}/elasticsearch/elasticsearch-rc.yml

kubectl get pod

echo -e "\n\n\n"

echo "success"




