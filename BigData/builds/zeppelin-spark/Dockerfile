FROM apache/zeppelin:0.12.1

USER root

ARG SPARK_VERSION=4.0.3
ENV SPARK_HOME=/opt/spark
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV PYSPARK_PYTHON=/usr/bin/python3
ENV PYSPARK_DRIVER_PYTHON=/usr/bin/python3

# Point Python directly to the Spark source folders instead of installing it via pip
ENV PYTHONPATH=$SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-src.zip:$PYTHONPATH

# FIX: Force the environment to use Java 17 instead of the base image's Java 11
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH=$SPARK_HOME/bin:$JAVA_HOME/bin:$PATH

# FIX: Disable Zeppelin's strict Spark version check layout
ENV ZEPPELIN_SPARK_ENABLESUPPORTEDVERSIONCHECK=false

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        procps \
        netcat-openbsd \
        openjdk-17-jdk \
        python3.11 \
        python3.11-venv \
        python3-pip && \
    ln -sf /usr/bin/python3.11 /usr/bin/python3 && \
    ln -sf /usr/bin/python3.11 /usr/bin/python && \
    rm -rf /var/lib/apt/lists/*

# Copy the pre-downloaded archive
COPY spark-4.0.3-bin-hadoop3.tgz /opt/

# Extract and structure the path
RUN mkdir -p ${SPARK_HOME} && \
    tar -xzf /opt/spark-4.0.3-bin-hadoop3.tgz -C /opt && \
    mv /opt/spark-4.0.3-bin-hadoop3/* ${SPARK_HOME}/ && \
    rm -rf /opt/spark-4.0.3-bin-hadoop3.tgz /opt/spark-4.0.3-bin-hadoop3

# Prepare directory for custom cluster configurations
RUN mkdir -p /etc/hadoop

EXPOSE 8080

CMD ["bin/zeppelin.sh"]
