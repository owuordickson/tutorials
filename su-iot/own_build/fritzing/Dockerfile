FROM conanio/gcc8

ENV FRITZING_VERSION 0.9.3b
ENV BOOST_ROOT /usr/local

USER root

RUN apt-get update && apt-get install -y \
      nano \
      tar \
      libssl1.0.0 \
      libgl1 \
      libssl-dev \
      '^libxcb.*-dev' \
      libx11-xcb-dev \
      libglu1-mesa-dev \
      libxrender-dev \
      libxi-dev \
      libxkbcommon-dev \
      libxkbcommon-x11-dev \
      qt5-default \
      qttools5-dev-tools

WORKDIR /opt
COPY /fritzing-0.9.3b.linux.AMD64.tar.bz2 .

RUN set -x \
    && tar -xvf /opt/fritzing-$FRITZING_VERSION.linux.AMD64.tar.bz2 -C /opt/ \
    && rm /opt/fritzing-$FRITZING_VERSION.linux.AMD64.tar.bz2* \
    && mv /opt/fritzing-$FRITZING_VERSION.linux.AMD64 /opt/fritzing

RUN export QT_DEBUG_PLUGINS=1

ENV FRITZING_HOME=/opt/fritzing
ENV PATH $FRITZING_HOME/:$PATH

CMD ["/opt/fritzing/Fritzing"]

#EXPOSE 5900
#RUN echo "exec /opt/fritzing/Fritzing" > ~/.xinitrc && chmod +x ~/.xinitrc
#CMD ["v11vnc", "-create", "-forever"]
