FROM ubuntu:rolling
MAINTAINER owuordickson@gmail.com

# Update Ubuntu Linux package manager and Install required software
RUN apt-get update && apt-get install -y nano \
    build-essential \
    git \
    cmake \
    libssl-dev \
    libudev-dev \
    qt5-default \
    libqt5serialport5-dev \
    libqt5svg5-dev


ENV FRITZING_VERSION 0.9.3b
WORKDIR /opt
COPY /fritzing-$FRITZING_VERSION.linux.AMD64.tar.bz2 .

RUN set -xe \
    && tar -xj /opt/fritzing-$FRITZING_VERSION.linux.AMD64.tar.bz2 -C /opt/ \
    && rm /opt/fritzing-$FRITZING_VERSION.linux.AMD64.tar.bz2* \
    && mv /opt/fritzing-$FRITZING_VERSION.linux.AMD64 /opt/fritzing

ENV FRITZING_HOME=/opt/fritzing
ENV PATH $FRITZING_HOME/:$PATH

CMD ["/opt/fritzing/Fritzing"]
