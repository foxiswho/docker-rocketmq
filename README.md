# docker-rocketmq
rocketmq


rocketmq Version 4.3.0


docker run -d -p 9876:9876 --name rmqserver  foxiswho/rocketmq:server
docker run -d -p 10911:10911 -p 10909:10909 --name rmqbroker --link rmqserver:namesrv -e "NAMESRV_ADDR=namesrv:9876" foxiswho/rocketmq:broker