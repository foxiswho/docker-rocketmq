#!/usr/bin/env bash

DIR=$(cd $(dirname $0); pwd)

echo "kubectl delete "

rm -rf ${DIR}/rocketmq/logs/*
rm -rf ${DIR}/rocketmq/logs-b/*
rm -rf ${DIR}/rocketmq/logs-b-s/*
rm -rf ${DIR}/rocketmq/logs-ui/*

rm -rf ${DIR}/rocketmq/store/*

rm -rf ${DIR}/rocketmq/store-b/*
rm -rf ${DIR}/rocketmq/store-b-s/*

kubectl delete -f  ${DIR}/rocketmq/ui-rc.yml
kubectl delete -f  ${DIR}/rocketmq/ui-service.yml


kubectl delete -f  ${DIR}/rocketmq/broker-s-rc.yml
kubectl delete -f  ${DIR}/rocketmq/broker-s-service.yml



kubectl delete -f  ${DIR}/rocketmq/broker-rc.yml
kubectl delete -f  ${DIR}/rocketmq/broker-service.yml


kubectl delete -f  ${DIR}/rocketmq/rocketmq-rc.yml
kubectl delete -f  ${DIR}/rocketmq/rocketmq-service.yml


kubectl get pod

echo -e "\n\n\n"

echo "success"




