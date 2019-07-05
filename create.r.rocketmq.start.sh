#!/usr/bin/env bash

DIR=$(cd $(dirname $0); pwd)


mkdir -p ${DIR}/rocketmq/logs/*
mkdir -p ${DIR}/rocketmq/logs-b/*
mkdir -p ${DIR}/rocketmq/logs-b-s/*
mkdir -p ${DIR}/rocketmq/logs-ui/*

mkdir -p ${DIR}/rocketmq/store/*
mkdir -p ${DIR}/rocketmq/store-b/*
mkdir -p ${DIR}/rocketmq/store-b-s/*

chmod -R 777 ${DIR}/rocketmq/store*
chmod -R 777 ${DIR}/rocketmq/logs*

kubectl create -f  ${DIR}/rocketmq/ui-rc.yml
kubectl create -f  ${DIR}/rocketmq/ui-service.yml


kubectl create -f  ${DIR}/rocketmq/broker-s-rc.yml
kubectl create -f  ${DIR}/rocketmq/broker-s-service.yml


kubectl create -f  ${DIR}/rocketmq/broker-rc.yml
kubectl create -f  ${DIR}/rocketmq/broker-service.yml


kubectl create -f  ${DIR}/rocketmq/rocketmq-rc.yml
kubectl create -f  ${DIR}/rocketmq/rocketmq-service.yml


echo "create  ui  success"
echo "create  broker-s  success"
echo "create  broker  success"
echo "create  rocketmq  success"


kubectl get pod

echo -e "\n\n\n"

echo "success"




