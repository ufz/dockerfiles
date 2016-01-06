FROM ogs6/gcc-dev-essentials
MAINTAINER Lars Bilke <lars.bilke@ufz.de>

RUN apt-get update && apt-get install -y \
  libeigen3-dev \
  freeglut3-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src
RUN curl -L -o boost_1_56_0.tar.gz http://sourceforge.net/projects/boost/files/boost/1.56.0/boost_1_56_0.tar.gz/download && \
  tar -xzf boost_1_56_0.tar.gz && \
  rm boost_1_56_0.tar.gz
ENV BOOST_ROOT=/usr/src/boost_1_56_0


