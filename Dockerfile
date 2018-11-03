FROM i386/ubuntu:bionic

ENV NODE_VERSION="8.11.3"
ENV NODE_ARCH="node-v${NODE_VERSION}-linux-x86"

RUN apt update && \
    apt install -y \
    build-essential \
    curl \
    python \
    apt-transport-https \
    ca-certificates \
    libssl-dev \
    wget \
    gcc-arm-linux-gnueabihf \
    g++-arm-linux-gnueabihf

ENV CC=arm-linux-gnueabihf-gcc
ENV CXX=arm-linux-gnueabihf-g++
ENV CC_host="gcc -m32"
ENV CXX_host="g++ -m32"

ENV PATH=${PATH}:/workdir/node/bin

WORKDIR /workdir

RUN mkdir -p ~/.npm && mkdir -p /.npm \
    && chown 1000:1000 /.npm \
    && mkdir -p /.node-gyp/8.11.3 \
    && chown -Rf 1000:1000 /.node-gyp

COPY ${NODE_ARCH}.tar.xz ./
COPY docker-entry.sh ./

RUN chown -Rf 1000:1000 /workdir && \
    chown -Rf 1000:1000 /.node-gyp/8.11.3

USER 1000:1000

RUN tar -xvJf ${NODE_ARCH}.tar.xz && \
    mv ${NODE_ARCH} node

RUN mkdir proj && \
    chmod +x docker-entry.sh

ENTRYPOINT [ "./docker-entry.sh" ]