################################################################################
### STAGE 1: Build Zeppelin from Source ###
FROM maven:3.5-jdk-8 as builder

# ARG BRANCH="master"
ARG SCALA_VER="2.11"
ARG SPARK_VER="2.2"
# ARG VERSION="0.8.0-SNAPSHOT"

ENV ZEPPELIN_VERSION=$VERSION \
    ZEPPELIN_SRC="/usr/src/zeppelin"

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
	&& apt-get update && apt-get install -y --no-install-recommends \
		git \
		nodejs \
		python3 python3-setuptools \
    r-base-dev r-cran-evaluate \
	&& rm -rf /var/lib/apt/lists/* \
  && mkdir -p $ZEPPELIN_SRC \
  && git clone https://github.com/apache/zeppelin.git $ZEPPELIN_SRC

WORKDIR $ZEPPELIN_SRC

# update all pom.xml to use the selected scala version
RUN ./dev/change_scala_version.sh $SCALA_VER 

# install bower dependencies
RUN npm install -g bower  \
	&& cd zeppelin-web \
  && bower install --config.interactive=false --allow-root --silent \
  && cd ..

# get all the MVN dependencies out of the way 
# RUN mvn --batch-mode verify clean -DskipTests -Dcheckstyle.skip --fail-never
 
# build zeppelin with all interpreters and include Apache Spark & Python support
RUN mvn --batch-mode package -DskipTests -Dcheckstyle.skip \
	-Pscala-$SCALA_VER -Pspark-$SPARK_VER -Pr -Phelium-dev -Pexamples -Pbuild-distr


################################################################################
### STAGE 2: Create the Runtime Container ###
FROM openjdk:8

ENV ZEPPELIN_SRC="/usr/src/zeppelin" \
	ZEPPELIN_HOME="/opt/zeppelin" \
	ZEPPELIN_CONF_DIR="/opt/zeppelin/conf" \
	ZEPPELIN_PORT=8080 \
	ZEPPELIN_SSL_PORT=8443

EXPOSE $ZEPPELIN_PORT $ZEPPELIN_SSL_PORT

VOLUME $ZEPPELIN_CONF_DIR \
       $ZEPPELIN_HOME/logs \
       $ZEPPELIN_HOME/notebook

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
	&& apt-get update && apt-get install -y --no-install-recommends \
		curl \
    jq \
		nodejs \
		python3 python3-pip \
    r-base-dev r-cran-evaluate \
	&& rm -rf /var/lib/apt/lists/* \
  && update-alternatives --install /usr/bin/python python /usr/bin/python2 1 \
  && update-alternatives --install /usr/bin/python python /usr/bin/python3 2 \
  && pip3 install --upgrade pip 


WORKDIR $ZEPPELIN_HOME

COPY --from=builder ${ZEPPELIN_SRC}/zeppelin-distribution/target/zeppelin.tar.gz $ZEPPELIN_HOME

RUN tar --strip-components=1 -xzvf zeppelin.tar.gz \
    && rm zeppelin.tar.gz

CMD ./bin/zeppelin.sh run