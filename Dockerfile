FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install --yes --no-install-recommends \
        git-core \
        mingw-w64 \
        wget \
        gcc \
        g++ \
        make \
        autotools-dev \
        libncurses5-dev \
        bzip2 \
        libexpat-dev \
        bison \
        flex \
    && rm --recursive --force /var/lib/apt/lists/*

RUN git clone --depth=1 git://github.com/raspberrypi/tools.git /opt/rpi-tools
ENV PATH="/opt/rpi-tools/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin:${PATH}"

RUN cd /tmp && \
    wget http://ftp.gnu.org/gnu/texinfo/texinfo-4.13a.tar.gz && \
    tar -xf texinfo-4.13a.tar.gz && \
    cd texinfo-4.13 && \
    ./configure && \
    make -j4 && \
    make install && \
    cd /tmp && \
    rm -rf texinfo*
