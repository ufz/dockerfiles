FROM ogs6/gcc-gui
MAINTAINER Lars Bilke <lars.bilke@ufz.de>

RUN apt-get update \
  && apt-get install -y \
    biber \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src
