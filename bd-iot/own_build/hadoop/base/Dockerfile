# FROM debian:9
FROM openjdk:8u222-stretch

RUN apt-get update && apt-get install -y --no-install-recommends \
      net-tools \
      ca-certificates \
      software-properties-common \
      ssh \
      #curl \
      tar \
      rsync \
      netcat \
      gnupg \
      libsnappy-dev \
    && rm -rf /var/lib/apt/lists/* 
      
# ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
ENV JAVA_HOME=/usr/local/openjdk-8

#RUN curl -O https://dist.apache.org/repos/dist/release/hadoop/common/KEYS
#RUN gpg --import KEYS

ENV HADOOP_VERSION 3.2.1
#ENV HADOOP_URL https://www.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz
ENV HADOOP_URL https://archive.apache.org/dist/hadoop/core/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz

RUN set -x \
    && curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz \
    && tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
    && rm /tmp/hadoop.tar.gz*

RUN ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop

RUN mkdir /opt/hadoop-$HADOOP_VERSION/logs

RUN mkdir /hadoop-data

ENV HADOOP_HOME=/opt/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV MULTIHOMED_NETWORK=1
ENV USER=root
ENV PATH $HADOOP_HOME/bin/:$PATH

ADD entrypoint.sh /entrypoint.sh

RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]