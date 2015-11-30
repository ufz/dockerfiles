FROM ubuntu:15.10
MAINTAINER Lars Bilke <lars.bilke@ufz.de>

RUN apt-get update && apt-get -y install \
  build-essential \
  git \
  python \
  wget \
  rsync \
  vim && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Install clang
RUN wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key| apt-key add - && \
  apt-get update && \
  apt-get -y install clang-3.7 lldb-3.7 && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ENV CC=clang-3.7
ENV CXX=clang++-3.7

# Build and install CMake from source.
WORKDIR /usr/src
RUN git clone https://github.com/Kitware/CMake.git CMake && \
  cd CMake && \
  git checkout v3.4.0
RUN mkdir CMake-build
WORKDIR /usr/src/CMake-build
RUN /usr/src/CMake/bootstrap \
    --parallel=$(nproc) \
    --prefix=/usr && \
  make -j$(nproc) install && \
  rm -rf *
WORKDIR /usr/src

# Build and install Ninja from source
RUN git clone https://github.com/martine/ninja.git && \
  cd ninja && \
  git checkout v1.6.0 && \
  python ./configure.py --bootstrap && \
  ./ninja && \
  cp ./ninja /usr/bin/

WORKDIR /usr/src
