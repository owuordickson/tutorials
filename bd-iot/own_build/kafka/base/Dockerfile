FROM bitnami/kafka:3.4

ENV IOT_TOPIC_NAME=iot-topic
EXPOSE 9092

COPY --chown=1001 kafka_iot_topic.sh /opt/bitnami/scripts/
RUN  chmod +x /opt/bitnami/scripts/kafka_iot_topic.sh


CMD ["sh", "./opt/bitnami/scripts/kafka_iot_topic.sh" ]
