FROM ogs6/gcc-ogs-base
MAINTAINER Lars Bilke <lars.bilke@ufz.de>

RUN apt-get update && apt-get install -y \
  qt4-dev-tools \
  libgeotiff-dev \
  libxt-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Build and install Catalyst-edition from source.
WORKDIR /usr/src
RUN git clone https://github.com/ufz/catalyst-gui.git catalyst
RUN mkdir catalyst-build
WORKDIR /usr/src/catalyst-build
RUN ../catalyst/cmake.sh ../catalyst && \
  make -j$(nproc)

ENV ParaView_DIR /usr/src/catalyst-build

WORKDIR /usr/src
