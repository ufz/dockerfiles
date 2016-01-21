FROM ubuntu:14.04
MAINTAINER Lars Bilke <lars.bilke@ufz.de>

RUN apt-get update && apt-get -y install \
  build-essential \
  git \
  python \
  wget \
  rsync \
  xz-utils \
  vim && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Build and install CMake from source.
WORKDIR /usr/src
RUN wget https://cmake.org/files/v3.4/cmake-3.4.2.tar.gz \
  && tar -xvf cmake-3.4.2.tar.gz \
  && cd cmake-3.4.2 \
  && ./bootstrap \
  && make -j$(nproc) \
  && make install \
  && rm -rf * \
  && cd .. && rm -rf cmake-*

# Install LLVM, see http://llvm.org/docs/CMake.html
RUN wget http://llvm.org/releases/3.7.0/llvm-3.7.0.src.tar.xz \
  && tar -Jxf llvm-3.7.0.src.tar.xz \
  && mkdir build-llvm && cd build-llvm \
  && cmake ../llvm-3.7.0.src -DCMAKE_BUILD_TYPE=Release \
  && make -j$(nproc) install \
  && cd .. && rm -rf build-llvm llvm-3.7.0.src llvm-3.7.0.src.tar.xz

# Clang
RUN wget http://llvm.org/releases/3.7.0/cfe-3.7.0.src.tar.xz \
  && tar -Jxf cfe-3.7.0.src.tar.xz \
  && mkdir build-cfe && cd build-cfe \
  && cmake ../cfe-3.7.0.src -DCMAKE_BUILD_TYPE=Release -DLLVM_CONFIG_PATH=/usr/local/bin/llvm-config \
  && make -j$(nproc) install \
  && cd .. && rm -rf build-cfe cfe-3.7.0.src fe-3.7.0.src.tar.xz

ENV CC=clang
ENV CXX=clang++

# Compiler-rt
RUN wget http://llvm.org/releases/3.7.0/compiler-rt-3.7.0.src.tar.xz \
  && tar -Jxf compiler-rt-3.7.0.src.tar.xz \
  && mkdir build-compiler-rt && cd build-compiler-rt \
  && cmake ../compiler-rt-3.7.0.src -DCMAKE_BUILD_TYPE=Release -DLLVM_CONFIG_PATH=/usr/local/bin/llvm-config \
  && make -j$(nproc) install \
  && cd .. && rm -rf build-compiler-rt compiler-rt-3.7.0.src compiler-rt-3.7.0.src.tar.xz

RUN mkdir /usr/local/lib/clang/3.7.0/lib
RUN ln -s /usr/local/lib/linux /usr/local/lib/clang/3.7.0/lib/linux

WORKDIR /usr/src

RUN apt-get update && apt-get -y install \
  ccache && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
ENV CCACHE_DIR=/usr/src/.ccache
ENV CCACHE_MAXSIZE=15G

# Add user jenkins to the image
RUN adduser --uid 500 --quiet jenkins \
  # Add user jenkins to sudoers with NOPASSWD
  && echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
  # Set password for the jenkins user (you may want to alter this).
  && RUN echo "jenkins:jenkins" | chpasswd
