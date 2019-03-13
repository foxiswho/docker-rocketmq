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

FROM foxiswho/rocketmq:base-4.4.0

EXPOSE 10909 10911

#RUN mv ${ROCKETMQ_HOME}/bin/runbroker-customize.sh ${ROCKETMQ_HOME}/bin/runbroker.sh \
# && chmod +x ${ROCKETMQ_HOME}/bin/runbroker.sh \
# && chmod +x ${ROCKETMQ_HOME}/bin/mqbroker

CMD cd ${ROCKETMQ_HOME}/bin \
 && export JAVA_OPT=" -Duser.home=/opt" \
 && export NAMESRV_ADDR="namesrv:9876" \
 && ${ROCKETMQ_HOME}/bin/mqbroker -c /etc/rocketmq/broker.conf


# broker 配置文件位于 /etc/rocketmq/broker.conf ，具体请看 broker Dockerfile CMD启动