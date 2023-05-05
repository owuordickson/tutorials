FROM ubuntu:rolling
MAINTAINER owuordickson@gmail.com

# Update Ubuntu Linux package manager and Install required software
RUN apt-get update && apt-get install -y nano \
    build-essential \
    git \
    cmake \
    libssl-dev \
    libudev-dev \
    qtbase5-dev \
    libqt5serialport5-dev \
    libqt5svg5-dev \
    xvfb

RUN apt-get install -y wget \
    && wget http://security.ubuntu.com/ubuntu/pool/main/o/openssl1.0/libssl1.0.0_1.0.2n-1ubuntu5.12_amd64.deb \
    && apt install ./libssl1.0.0_1.0.2n-1ubuntu5.12_amd64.deb

ENV FRITZING_VERSION 0.9.3b
WORKDIR /opt
COPY /base/fritzing-$FRITZING_VERSION.linux.AMD64.tar.bz2 .
RUN set -xe \
    && tar -xvf /opt/fritzing-$FRITZING_VERSION.linux.AMD64.tar.bz2 -C /opt/ \
    && rm /opt/fritzing-$FRITZING_VERSION.linux.AMD64.tar.bz2* \
    && mv /opt/fritzing-$FRITZING_VERSION.linux.AMD64 /opt/fritzing

ENV FRITZING_HOME=/opt/fritzing
ENV PATH $FRITZING_HOME/:$PATH

#CMD ["/opt/fritzing/Fritzing"]
