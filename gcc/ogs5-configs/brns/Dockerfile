FROM ogs5/gcc-ogs-base
LABEL maintainer="lars.bilke@ufz.de"

RUN apt-get update && apt-get install -y \
  liblapack-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
