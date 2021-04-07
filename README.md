# tag
- 4.8.0
- 4.7.0
- server-4.6.1 , broker-4.6.1
- server-4.5.2 , broker-4.5.2
- server-4.5.1 , broker-4.5.1
- server-4.5.0 , broker-4.5.0

推荐使用最新版

# 注意
# 注意
# 注意
映射本地目录权限一定要设置为 777 权限，否则启动不成功
>映射本地目录权限一定要设置为 777 权限，否则启动不成功
>
>映射本地目录权限一定要设置为 777 权限，否则启动不成功
>

# 本镜像使用的是官方的

https://github.com/apache/rocketmq-docker

官方地址,有问题找官方

# docker-rocketmq
rocketmq

rocketmq Version  4.5.1, 4.5.2 ,4.6.1 , 4.7.0 , 4.8.0

# docker-rocketmq 镜像

4.7.0 及以后 版本镜像 将 不在根据base镜像生成 server，broker  镜像，统一使用  base  镜像，两者区别只是调用的 启动文件不同


# 一键部署 docker-compose
案例 版本 4.8.0

```SHELL
git clone  https://github.com/foxiswho/docker-rocketmq.git

cd docker-rocketmq

cd rmq


chmod +x  start.sh

./start.sh

```

访问浏览器
```SHELL
localhost:8180
```

>注意 如果你的微服务或者项目在开发的时候没有放入`docker`中或者与`rocketmq`容器不能直接用IP访问，
那么请把`broker.conf`中的 `#brokerIP1=192.168.0.253` 前面`#`号去掉，并且把后面的`IP地址`改成你的`rocketmq`容器宿主机`IP地址`,
否则报 `com.alibaba.rocketmq.remoting.exception.RemotingConnectException: connect to <172.0.0.120:10909> failed`
>配置文件 在 `rmq/rmq/brokerconf` 目录下

# rocketmq 4.8.0 新版 启动
## server
### server 无日志目录映射
```bash
docker run -d \
      --name rmqnamesrv \
      -e "JAVA_OPT_EXT=-Xms512M -Xmx512M -Xmn128m" \
      -p 9876:9876 \
      foxiswho/rocketmq:4.8.0 \
      sh mqnamesrv
```
### server 有日志目录映射
```bash
docker run -d -v $(pwd)/logs:/home/rocketmq/logs \
      --name rmqnamesrv \
      -e "JAVA_OPT_EXT=-Xms512M -Xmx512M -Xmn128m" \
      -p 9876:9876 \
      foxiswho/rocketmq:4.8.0 \
      sh mqnamesrv
```
本地 logs 目录一定要是 777 权限
## broker
### broker 无 目录映射
```bash
docker run -d \
      --name rmqnamesrv \
      -e "JAVA_OPT_EXT=-Xms512M -Xmx512M -Xmn128m" \
      -p 9876:9876 \
      foxiswho/rocketmq:4.8.0 \
      sh mqbroker -c /home/rocketmq/conf/broker.conf
```
### broker 目录映射
```bash
docker run -d  -v $(pwd)/logs:/home/rocketmq/logs -v $(pwd)/store:/home/rocketmq/store \
      -v $(pwd)/conf:/home/rocketmq/conf \
      --name rmqbroker \
      -e "NAMESRV_ADDR=rmqnamesrv:9876" \
      -e "JAVA_OPT_EXT=-Xms512M -Xmx512M -Xmn128m" \
      -p 10911:10911 -p 10912:10912 -p 10909:10909 \
      foxiswho/rocketmq:4.8.0 \
      sh mqbroker -c /home/rocketmq/conf/broker.conf
```


注意（重要的事说3遍）

注意（重要的事说3遍）

注意（重要的事说3遍）

>如果你的微服务没有使用`docker`,那么需要把`/etc/rocketmq/broker.conf` 配置文件中的`brokerIP1=192.168.0.253` 这个启用，IP 地址填写 你docker 所在 宿主机的IP ，否则报错
>
>本地 logs 目录一定要是 777 权限

## console
来自
https://hub.docker.com/r/styletang/rocketmq-console-ng/

```SEHLL
docker run --name rmqconsole --link rmqserver:rmqserver \
-e "JAVA_OPTS=-Drocketmq.namesrv.addr=rmqserver:9876 -Dcom.rocketmq.sendMessageWithVIPChannel=false" \
-p 8180:8080 -t styletang/rocketmq-console-ng
```

浏览器访问
```SEHLL
localhost:8180
```

Example:
```SEHLL
docker run --name rmqconsole --link rmqserver:namesrv \
-e "JAVA_OPTS=-Drocketmq.namesrv.addr=rmqserver:9876 -Dcom.rocketmq.sendMessageWithVIPChannel=false" \
-p 8180:8080 -t styletang/rocketmq-console-ng
```


# 其他案例

https://github.com/foxiswho/docker-nacos-sentinel-rocketmq-rabbitmq

https://github.com/foxiswho/docker-consul-fabio-apollo-rocketmq-rabbitmq

K8S 案例

https://github.com/foxiswho/k8s-nacos-sentinel-rocketmq-zipkin-elasticsearch-redis-mysql
