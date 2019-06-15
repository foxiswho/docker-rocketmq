#!/usr/bin/env bash



mkdir -p /www/k8s/foxdev/rocketmq/logs/*
mkdir -p /www/k8s/foxdev/rocketmq/logs-b/*
mkdir -p /www/k8s/foxdev/rocketmq/logs-b-s/*
mkdir -p /www/k8s/foxdev/rocketmq/logs-ui/*

mkdir -p /www/k8s/foxdev/rocketmq/store/*
mkdir -p /www/k8s/foxdev/rocketmq/store-b/*
mkdir -p /www/k8s/foxdev/rocketmq/store-b-s/*

kubectl create -f  ui-rc.yml
kubectl create -f  ui-service.yml


kubectl create -f  broker-s-rc.yml
kubectl create -f  broker-s-service.yml



kubectl create -f  broker-rc.yml
kubectl create -f  broker-service.yml


kubectl create -f  rocketmq-rc.yml
kubectl create -f  rocketmq-service.yml


echo "create  ui  success"
echo "create  broker-s  success"
echo "create  broker  success"
echo "create  rocketmq  success"
