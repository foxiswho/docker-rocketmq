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

FROM centos:7

RUN yum install -y java-1.8.0-openjdk-devel.x86_64 unzip gettext nmap-ncat openssl, which gnupg, telnet \
 && yum clean all -y

# FROM openjdk:8-jdk
# RUN apt-get update && apt-get install -y --no-install-recommends \
#		bash libapr1 unzip telnet wget gnupg ca-certificates \
#	&& rm -rf /var/lib/apt/lists/*

ARG user=rocketmq
ARG group=rocketmq
ARG uid=3000
ARG gid=3000

# RocketMQ is run with user `rocketmq`, uid = 3000
# If you bind mount a volume from the host or a data container,
# ensure you use the same uid
RUN groupadd -g ${gid} ${group} \
    && useradd -u ${uid} -g ${gid} -m -s /bin/bash ${user} 

ARG version=4.8.0

# Rocketmq version
ENV ROCKETMQ_VERSION ${version}

# Rocketmq home
ENV ROCKETMQ_HOME  /home/rocketmq/rocketmq-${ROCKETMQ_VERSION}

WORKDIR  ${ROCKETMQ_HOME}

RUN set -eux; \
    curl https://archive.apache.org/dist/rocketmq/${ROCKETMQ_VERSION}/rocketmq-all-${ROCKETMQ_VERSION}-bin-release.zip -o rocketmq.zip; \
    curl https://archive.apache.org/dist/rocketmq/${ROCKETMQ_VERSION}/rocketmq-all-${ROCKETMQ_VERSION}-bin-release.zip.asc -o rocketmq.zip.asc; \
    #https://www.apache.org/dist/rocketmq/KEYS
	#curl https://www.apache.org/dist/rocketmq/KEYS -o KEYS; \
	\
	#gpg --import KEYS; \
    #gpg --batch --verify rocketmq.zip.asc rocketmq.zip ; \
    unzip rocketmq.zip ; \
	mv rocketmq-all*/* . ; \
	rmdir rocketmq-all*  ; \
	rm -rf rocketmq.zip rocketmq.zip.asc KEYS

# add scripts
COPY scripts/ ${ROCKETMQ_HOME}/bin/

RUN mkdir -p /home/rocketmq/logs \
    && mkdir -p /home/rocketmq/store \
    && chown -R ${uid}:${gid} /home/rocketmq \
    && chown -R ${uid}:${gid} ${ROCKETMQ_HOME}

# expose namesrv port
EXPOSE 9876

# add customized scripts for namesrv
RUN mv -bf ${ROCKETMQ_HOME}/bin/runserver-customize.sh ${ROCKETMQ_HOME}/bin/runserver.sh \
 && chmod a+x ${ROCKETMQ_HOME}/bin/runserver.sh \
 && chmod a+x ${ROCKETMQ_HOME}/bin/mqnamesrv

# expose broker ports
EXPOSE 10909 10911 10912

# add customized scripts for broker
RUN mv -bf ${ROCKETMQ_HOME}/bin/runbroker-customize.sh ${ROCKETMQ_HOME}/bin/runbroker.sh \
 && chmod a+x ${ROCKETMQ_HOME}/bin/runbroker.sh \
 && chmod a+x ${ROCKETMQ_HOME}/bin/mqbroker \
 && ln -s ${ROCKETMQ_HOME}/bin/mqadmin /usr/local/bin/mqadmin  \
    && ln -s ${ROCKETMQ_HOME}/bin/runbroker /usr/local/bin/runbroker \
    && ln -s ${ROCKETMQ_HOME}/bin/mqnamesrv /usr/local/bin/mqnamesrv \
    && ln -s ${ROCKETMQ_HOME}/bin/mqbroker /usr/local/bin/mqbroker \
    && ln -s ${ROCKETMQ_HOME}/bin/runbroker.sh /usr/local/bin/runbroker.sh \
    && ln -s ${ROCKETMQ_HOME}/bin/runserver.sh /usr/local/bin/runserver.sh \
    && ln -s ${ROCKETMQ_HOME}/bin/runbroker.sh /usr/local/bin/runbroker-customize.sh \
    && ln -s ${ROCKETMQ_HOME}/bin/runserver.sh /usr/local/bin/runserver-customize.sh

# export Java options
RUN export JAVA_OPT=" -Duser.home=/home/rocketmq"

# Add ${JAVA_HOME}/lib/ext as java.ext.dirs
RUN sed -i 's/${JAVA_HOME}\/jre\/lib\/ext/${JAVA_HOME}\/jre\/lib\/ext:${JAVA_HOME}\/lib\/ext/' ${ROCKETMQ_HOME}/bin/tools.sh

USER ${user}

WORKDIR ${ROCKETMQ_HOME}/bin
