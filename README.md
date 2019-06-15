# k8s-nacos-sentinel-rocketmq-zipkin-elasticsearch-redis-mysql
Kubernetes(k8s)-nacos-sentinel-rocketmq-zipkin-elasticsearch-redis-mysql


k8s 开发 `单服务器` 部署

# 环境，与系统

系统：centos 7.6

内核： 5.1.9-1.el7.elrepo.x86_64

Kubernetes(K8s) 1.14.3

服务器IP：`192.168.0.254`

## 服务器IP 说明
如果更改了服务器IP 为其他IP，那么请全局全部替换成你改的IP

# 如何安装 k8s 
请看 最近写的一篇文章，

https://blog.csdn.net/fenglailea/article/details/88745642

常用 k8s 命令

https://foxwho.blog.csdn.net/article/details/92137467

# 目录

请把项目放置到 `/www/k8s/foxdev/` 目录下，所有都是基于此目录

# 服务器资源限制
对CPU,内存都做了限制，请自行针对修改

没有使用持久化存储，这里直接使用宿主机存储，如有需要，请自行增加

# 一键部署 即开即用服务

待添加

---
以下是 独立部署 相关模块
---



# k8s rocketmq 独立部署 

rocketmq 采用 server:1主,Broker:1主1从模式

带有 rocketmq-console web 简单管理界面

## 相关参数说明

端口： 
>`server:`          宿主机IP:9876
>`Broker:(master)`  宿主机IP:10909
>`Broker:(master)`  宿主机IP:10911
>`Broker:(master)`  宿主机IP:10912
>`Broker:(slave)`   宿主机IP:10919
>`Broker:(slave)`   宿主机IP:10921
>`Broker:(slave)`   宿主机IP:10922
>`ui:(console)`     宿主机IP:8180


broker中3个端口说明
 1. `listenPort=10911`    Broker 对外服务的监听端口
 2. `haListenPort=10912`    haService中使用  默认值为：listenPort + 1
 3. `fastListenPort=10909`  主要用于slave同步master  listenPort - 2


`XX-rc.yml`文件启动参数`autoCreateTopicEnable=true`，表示 `允许 Broker 自动创建Topic`

## 日志相关目录
执行命令时候，会自动创建 以下7个目录，部署时候要映射 pod内部目录
```shell
/www/k8s/foxdev/rocketmq/logs/
/www/k8s/foxdev/rocketmq/logs-b/
/www/k8s/foxdev/rocketmq/logs-b-s/
/www/k8s/foxdev/rocketmq/logs-ui/

/www/k8s/foxdev/rocketmq/store/
/www/k8s/foxdev/rocketmq/store-b/
/www/k8s/foxdev/rocketmq/store-b-s/
```
logs: server 日志目录
logs-b: Broker(master) 日志目录
logs-b-s: Broker(slave) 日志目录
logs-ui: console 日志目录
 
store:      server store 目录
store-b:    Broker(master) store 目录
store-b-s:  Broker(slave) store 目录

## 独立部署 rocketmq 操作
直接执行 rocketmq 目录下 `rmq.start.sh` 即可

大约几分钟后，使用rocketmq或者访问浏览器`http://192.168.0.254:8180`,即可看到 `rocketmq-console`的管理界面


## 使用命令查看相关信息
```shell
kubectl get svc,pod,cs,rc

或
kubectl get svc

kubectl get pod

kubectl get cs

kubectl get rc

```










