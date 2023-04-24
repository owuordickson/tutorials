FROM openjdk:8u222-stretch

RUN apt-get update && apt-get install -y --no-install-recommends \
      net-tools \
      ca-certificates \
      software-properties-common \
      ssh \
      curl \
      nano \
      tar \
      rsync \
      netcat \
      gnupg \
      libsnappy-dev \
    && rm -rf /var/lib/apt/lists/* 
      
ENV JAVA_HOME=/usr/local/openjdk-8

ENV FRITZING_VERSION 0.9.3b

WORKDIR /opt
COPY /fritzing-0.9.3b.linux.AMD64.tar.bz2 .

RUN set -x \
    && tar -xvf /opt/fritzing-$FRITZING_VERSION.linux.AMD64.tar.bz2 -C /opt/ \
    && rm /opt/fritzing-$FRITZING_VERSION.linux.AMD64.tar.bz2* \
    && mv /opt/fritzing-$FRITZING_VERSION.linux.AMD64 /opt/fritzing

ENV FRITZING_HOME=/opt/fritzing
ENV PATH $FRITZING_HOME/:$PATH

CMD ["/opt/fritzing/Fritzing"]
