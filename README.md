# docker-rocketmq
rocketmq


rocketmq Version 4.3.0

# server
docker run -d -p 9876:9876 --name rmqserver  foxiswho/rocketmq:server

# broker

docker run -d -p 10911:10911 -p 10909:10909 --name rmqbroker --link rmqserver:namesrv -e "NAMESRV_ADDR=namesrv:9876" foxiswho/rocketmq:broker



# console

https://hub.docker.com/r/styletang/rocketmq-console-ng/

```SEHLL
docker run --link rmqserver:namesrv -e "JAVA_OPTS=-Drocketmq.namesrv.addr=IP地址:9876 -Dcom.rocketmq.sendMessageWithVIPChannel=false" -p 8180:8080 -t styletang/rocketmq-console-ng
```

浏览器访问
```angular2html
localhost:8180
```

Example:

docker run --link rmqserver:namesrv -e "JAVA_OPTS=-Drocketmq.namesrv.addr=namesrv:9876 -Dcom.rocketmq.sendMessageWithVIPChannel=false" -p 8180:8080 -t styletang/rocketmq-console-ng