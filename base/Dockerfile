#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This is maintained as the base image for namesrv and broker.
#FROM java:8
FROM centos:7

# Rocketmq version
ENV ROCKETMQ_VERSION "4.5.0"

# Rocketmq home
ENV ROCKETMQ_HOME  /opt/rocketmq-${ROCKETMQ_VERSION}

#tme zone
RUN rm -rf /etc/localtime \
&& ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN yum install -y java-1.8.0-openjdk-headless unzip gettext nmap-ncat openssl\
 && yum clean all -y

RUN mkdir -p \
 /opt/logs \
 /opt/store

RUN mkdir -p ${ROCKETMQ_HOME}


WORKDIR  ${ROCKETMQ_HOME}

# get the version
RUN cd /  \
 && curl https://dist.apache.org/repos/dist/release/rocketmq/${ROCKETMQ_VERSION}/rocketmq-all-${ROCKETMQ_VERSION}-bin-release.zip -o rocketmq.zip \
 && unzip rocketmq.zip \
 && rm -rf rocketmq-all*.zip \
 && rm -rf rocketmq.zip \
 && mv rocketmq-all-${ROCKETMQ_VERSION}-bin-release/*  ${ROCKETMQ_HOME}/ \
 && rm -rf rocketmq-all*

# add scripts
COPY scripts/ ${ROCKETMQ_HOME}/bin/

#
RUN chmod -R +x ${ROCKETMQ_HOME}/bin/* \
   && cd ${ROCKETMQ_HOME}/bin/  \
   && ls -alF  \
   && mkdir -p /etc/rocketmq \
   && cp -rf ${ROCKETMQ_HOME}/conf/broker.conf  /etc/rocketmq/ \
   && mv ${ROCKETMQ_HOME}/conf/broker.conf ${ROCKETMQ_HOME}/conf/broker.conf.old \
   && ln -s ${ROCKETMQ_HOME}/bin/mqadmin /usr/local/bin/mqadmin  \
   && ln -s ${ROCKETMQ_HOME}/bin/runbroker /usr/local/bin/runbroker \
   && ln -s ${ROCKETMQ_HOME}/bin/mqnamesrv /usr/local/bin/mqnamesrv \
   && ln -s ${ROCKETMQ_HOME}/bin/mqbroker /usr/local/bin/mqbroker \
   && ln -s ${ROCKETMQ_HOME}/bin/runbroker-customize.sh /usr/local/bin/runbroker-customize.sh \
   && ln -s ${ROCKETMQ_HOME}/bin/runserver-customize.sh /usr/local/bin/runserver-customize.sh

RUN sed -i 's/${JAVA_HOME}\/jre\/lib\/ext/${JAVA_HOME}\/jre\/lib\/ext:${JAVA_HOME}\/lib\/ext/' ${ROCKETMQ_HOME}/bin/tools.sh

# broker 配置文件位于 /etc/rocketmq/broker.conf ，具体请看 broker Dockerfile CMD启动

VOLUME /opt/logs /opt/store