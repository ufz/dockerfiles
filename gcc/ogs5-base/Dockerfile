FROM ogs6/gcc-dev-essentials
MAINTAINER Lars Bilke <lars.bilke@ufz.de>

RUN apt-get update && apt-get install -y \
  libopenmpi-dev
  openmpi-bin
  subversion && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
