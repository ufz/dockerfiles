FROM ogs6/gcc-base
LABEL maintainer="lars.bilke@ufz.de"

USER root

RUN apt-get update && apt-get install -y \
  biber \
  qtbase5-dev \
  libqt5xmlpatterns5-dev \
  libgeotiff-dev \
  libshp-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

USER jenkins
WORKDIR /home/jenkins
