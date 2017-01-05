FROM ogs6/gcc-base
MAINTAINER Lars Bilke <lars.bilke@ufz.de>

RUN apt-get update && apt-get install -y \
  qtbase5-dev \
  libqt5xmlpatterns5-dev \
  libgeotiff-dev \
  libshp-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src
