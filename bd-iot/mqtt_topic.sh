#/bin/bash

/opt/bitnami/kafka/bin/kafka-topics.sh --create --topic $IOT_TOPIC_NAME --bootstrap-server kafka:9092
echo "topic $IOT_TOPIC_NAME was created"