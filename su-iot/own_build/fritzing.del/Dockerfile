FROM fedora:30

ENV FRITZING_VERSION 0.9.3b
ENV BOOST_VERSION 1_70_0
ENV LIBGIT2_VERSION 0.28.1

#ENV DISPLAY=host.docker.internal:0


RUN dnf -y install cmake wget git flex bison libudev-devel
RUN dnf -y install make gcc gcc-c++ kernel-devel ncurses-devel

RUN dnf -y install openssl-devel zlib-devel libjpeg-devel libpng-devel bzip2 libgit2-devel boost-devel
RUN dnf -y install xorg-x11-server-Xvfb qt-creator qt5-devel

RUN ln -s /usr/bin/qmake-qt5 /usr/bin/qmake
RUN ln -s /usr/bin/lrelease-qt5 /usr/bin/lrelease

RUN dnf clean all


RUN groupadd -g 1000 conan1 && \
    groupadd -g 1001 conan2 && \
    groupadd -g 2000 travis && \
    useradd -ms /bin/bash conan -u 1000 -g conan1 -G conan2,travis,999 && \
    echo "conan ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/conan && \
    chmod 0440 /etc/sudoers.d/conan

WORKDIR /home/conan
COPY /base .
USER conan

#RUN set -xe \
#    && tar -xvf fritzing-$FRITZING_VERSION.linux.AMD64.tar.bz2 -C .\
#    && rm fritzing-$FRITZING_VERSION.linux.AMD64.tar.bz2* \
#    && mv fritzing-$FRITZING_VERSION.linux.AMD64 fritzing

# No SHA verification for now. Will be automated by Conan in the future.
RUN set -xe \
    # && wget -q -O - https://dl.bintray.com/boostorg/release/1.70.0/source/boost_$BOOST_VERSION.tar.bz2 | tar xj
    && tar -xvf boost_$BOOST_VERSION.tar.bz2 -C .\
    && rm boost_$BOOST_VERSION.tar.bz2*

RUN set -xe \
    # && wget -q -O - https://github.com/libgit2/libgit2/archive/v$LIBGIT2_VERSION.tar.gz | tar xz \
    && tar -xvf libgit2-$LIBGIT2_VERSION.tar.gz -C .\
    && rm libgit2-$LIBGIT2_VERSION.tar.gz \
    && mv libgit2-$LIBGIT2_VERSION libgit2 \
    && mkdir libgit2/build \
    && cd libgit2/build \
    && cmake -D BUILD_SHARED_LIBS=OFF .. \
    && cmake --build . -- -j4 \
    && cd ../../


#ADD entrypoint.sh /entrypoint.sh
#ENTRYPOINT ["/entrypoint.sh"]
