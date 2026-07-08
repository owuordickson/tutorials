FROM eclipse-temurin:17-jdk-alpine

LABEL maintainer="Dickson Owuor"

ARG HADOOP_VERSION=3.5.0

ENV JAVA_HOME=/opt/java/openjdk \
    HADOOP_VERSION=${HADOOP_VERSION} \
    HADOOP_HOME=/opt/hadoop \
    HADOOP_CONF_DIR=/opt/hadoop/etc/hadoop \
    HADOOP_LOG_DIR=/opt/hadoop/logs \
    MULTIHOMED_NETWORK=1 \
    PATH=/opt/hadoop/bin:/opt/hadoop/sbin:$PATH

# --- CRITICAL: FIX FOR JAVA 17 COMPATIBILITY WITH HADOOP 3.5+ ---
ENV HADOOP_OPTS="-Djava.net.preferIPv4Stack=true \
    --add-opens=java.base/java.lang=ALL-UNNAMED \
    --add-opens=java.base/java.util=ALL-UNNAMED \
    --add-opens=java.base/java.util.concurrent=ALL-UNNAMED \
    --add-opens=java.base/java.io=ALL-UNNAMED \
    --add-opens=java.base/java.net=ALL-UNNAMED \
    --add-opens=java.base/java.nio=ALL-UNNAMED \
    --add-opens=java.base/java.security=ALL-UNNAMED \
    --add-opens=java.base/sun.nio.ch=ALL-UNNAMED \
    --add-opens=java.management/com.sun.jmx.mbeanserver=ALL-UNNAMED"

# Install Alpine-equivalent utilities and bash (required by Hadoop scripts)
RUN apk add --no-cache \
    bash \
    curl \
    ca-certificates \
    openssh-client \
    rsync \
    procps \
    netcat-openbsd \
    nano \
    snappy-dev \
    coreutils

#RUN mkdir -p /opt && \
#    curl -fsSL \
#    https://downloads.apache.org/hadoop/core/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz\
#    | tar -xz -C /opt && \
#    mv /opt/hadoop-${HADOOP_VERSION} ${HADOOP_HOME}

WORKDIR /opt
ADD hadoop-3.5.0.tar.gz .
RUN mv hadoop-3.5.0 ${HADOOP_HOME}

RUN mkdir -p \
    ${HADOOP_HOME}/logs \
    /opt/hadoop/dfs/name \
    /opt/hadoop/dfs/data \
    /tmp/hadoop

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 9870 9864 9000

ENTRYPOINT ["/entrypoint.sh"]
