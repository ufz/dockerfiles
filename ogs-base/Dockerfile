FROM bilke/dev-essentials
MAINTAINER Lars Bilke <lars.bilke@ufz.de>

RUN apt-get update && apt-get install -y \
  libboost-dev \
  libboost-date-time-dev \
  libboost-filesystem-dev \
  libboost-program-options-dev \
  libboost-system-dev \
  libeigen3-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
