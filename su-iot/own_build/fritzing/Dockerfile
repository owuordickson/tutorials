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
    sudo \
    xvfb

RUN apt-get install -y wget \
    && wget http://security.ubuntu.com/ubuntu/pool/main/o/openssl1.0/libssl1.0.0_1.0.2n-1ubuntu5.12_amd64.deb \
    && apt install ./libssl1.0.0_1.0.2n-1ubuntu5.12_amd64.deb

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

ENV FRITZING_VERSION 0.9.3b
WORKDIR /opt
COPY /base .

# RUN apt install /opt/libssl1.0.0_1.0.2n-1ubuntu5.12_amd64.deb

RUN set -xe \
    && tar -xvf /opt/fritzing-$FRITZING_VERSION.linux.AMD64.tar.bz2 -C /opt/ \
    && rm /opt/fritzing-$FRITZING_VERSION.linux.AMD64.tar.bz2* \
    && mv /opt/fritzing-$FRITZING_VERSION.linux.AMD64 /opt/fritzing

ENV FRITZING_HOME=/opt/fritzing
ENV PATH $FRITZING_HOME/:$PATH

USER developer

#CMD ["/opt/fritzing/Fritzing"]
