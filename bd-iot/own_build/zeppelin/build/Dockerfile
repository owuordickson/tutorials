################################################################################
### STAGE 1: Build Zeppelin from Source ###
FROM maven:3.5-jdk-8 as builder

ARG BRANCH="branch-0.8"
ARG SCALA_VER="2.11"
ARG SPARK_VER="2.2"
ARG VERSION="0.8.0-SNAPSHOT"

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
  && git clone --branch $BRANCH https://github.com/apache/zeppelin.git $ZEPPELIN_SRC

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
