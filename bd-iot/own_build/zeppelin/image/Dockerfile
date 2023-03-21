
################################################################################
### STAGE 2: Create the Runtime Container ###
# FROM openjdk:8u222-stretch
FROM owuor/zeppelin-build

ENV ZEPPELIN_SRC="/usr/src/zeppelin" \
	ZEPPELIN_HOME="/opt/zeppelin" \
	ZEPPELIN_CONF_DIR="/opt/zeppelin/conf" \
	ZEPPELIN_PORT=8080 \
	ZEPPELIN_SSL_PORT=8443

EXPOSE $ZEPPELIN_PORT $ZEPPELIN_SSL_PORT

VOLUME $ZEPPELIN_CONF_DIR \
       $ZEPPELIN_HOME/logs \
       $ZEPPELIN_HOME/notebook

WORKDIR $ZEPPELIN_HOME

COPY --from=builder ${ZEPPELIN_SRC}/zeppelin-distribution/target/zeppelin.tar.gz $ZEPPELIN_HOME

RUN tar --strip-components=1 -xzvf zeppelin.tar.gz \
    && rm zeppelin.tar.gz

CMD ./bin/zeppelin.sh run