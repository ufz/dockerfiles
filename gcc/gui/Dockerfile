FROM ogs6/gcc-base
MAINTAINER Lars Bilke <lars.bilke@ufz.de>

RUN apt-get update && apt-get install -y \
  qt4-dev-tools \
  libgeotiff-dev \
  libshp-dev \
  libxt-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src
