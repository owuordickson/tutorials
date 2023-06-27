FROM apache/zeppelin:0.9.0

ARG FLINK_VERSION=1.12.7
ARG FLINK_URL="https://archive.apache.org/dist/flink/flink-$FLINK_VERSION/flink-$FLINK_VERSION-bin-scala_2.11.tgz"

USER root

RUN set -x \
    && curl -fSL "$FLINK_URL" -o /tmp/flink.tgz \
    && tar -xvf /tmp/flink.tgz -C /opt/ \
    && rm /tmp/flink.tgz* \
    && mv /opt/flink-$FLINK_VERSION /opt/flink

ENV FLINK_HOME /opt/flink
EXPOSE 8080
EXPOSE 8081


