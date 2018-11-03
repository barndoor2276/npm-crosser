FROM i386/ubuntu:bionic

RUN sudo apt update && \
    sudo apt install -y \
    build-essentials \
    curl \
    gcc-arm-linux-gnueabihf \
    g++-arm-linux-gnueabihf

ENV CC=arm-linux-gnueabihf-gcc
ENV CXX=arm-linux-gnueabihf-g++
ENV CC_host="gcc -m32"
ENV CXX_host="g++ -m32"

WORKDIR /workdir

RUN nvm install 8.11.3

# RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

# COPY node*.tar.xz ./

# RUN tar -xvJf node*.tar.xz -C node

# ENV PATH=${PATH}:/workdir/node/bin