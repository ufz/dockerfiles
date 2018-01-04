FROM ubuntu:16.04
MAINTAINER Lars Bilke <lars.bilke@ufz.de>

RUN apt-get update && apt-get -y install \
  build-essential \
  git \
  python-pip \
  python2.7 \
  wget \
  rsync \
  xz-utils \
  vim && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN pip install conan==0.30.3 cmake
ENV CONAN_SYSREQUIRES_SUDO=0

# Install LLVM, see http://llvm.org/docs/CMake.html
RUN wget http://llvm.org/releases/3.9.0/llvm-3.9.0.src.tar.xz \
  && tar -Jxf llvm-3.9.0.src.tar.xz \
  && mkdir build-llvm && cd build-llvm \
  && cmake ../llvm-3.9.0.src -DCMAKE_BUILD_TYPE=Release \
  && make -j$(nproc) install \
  && cd .. && rm -rf build-llvm llvm-3.9.0.src llvm-3.9.0.src.tar.xz

# Clang
RUN wget http://llvm.org/releases/3.9.0/cfe-3.9.0.src.tar.xz \
  && tar -Jxf cfe-3.9.0.src.tar.xz \
  && mkdir build-cfe && cd build-cfe \
  && cmake ../cfe-3.9.0.src -DCMAKE_BUILD_TYPE=Release -DLLVM_CONFIG_PATH=/usr/local/bin/llvm-config \
  && make -j$(nproc) install \
  && cd .. && rm -rf build-cfe cfe-3.9.0.src fe-3.9.0.src.tar.xz

ENV CC=clang
ENV CXX=clang++

# Compiler-rt
RUN wget http://llvm.org/releases/3.9.0/compiler-rt-3.9.0.src.tar.xz \
  && tar -Jxf compiler-rt-3.9.0.src.tar.xz \
  && mkdir build-compiler-rt && cd build-compiler-rt \
  && cmake ../compiler-rt-3.9.0.src -DCMAKE_BUILD_TYPE=Release -DLLVM_CONFIG_PATH=/usr/local/bin/llvm-config \
  && make -j$(nproc) install \
  && cd .. && rm -rf build-compiler-rt compiler-rt-3.9.0.src compiler-rt-3.9.0.src.tar.xz

RUN mkdir /usr/local/lib/clang/3.9.0/lib
RUN ln -s /usr/local/lib/linux /usr/local/lib/clang/3.9.0/lib/linux

WORKDIR /usr/src

RUN apt-get update && apt-get -y install \
  unzip \
  ccache && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
ENV CCACHE_DIR=/usr/src/.ccache
ENV CCACHE_MAXSIZE=15G
ENV CCACHE_SLOPPINESS=pch_defines,time_macros

# Ninja
RUN wget https://github.com/ninja-build/ninja/releases/download/v1.8.2/ninja-linux.zip \
  && unzip ninja-linux.zip \
  && mv ninja /usr/local/bin/ninja \
  && rm ninja-linux.zip

# Add user jenkins to the image
RUN adduser --uid 500 --disabled-password --gecos "" jenkins \
  # Add user jenkins to sudoers with NOPASSWD
  && echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
  # Set password for the jenkins user (you may want to alter this).
  && echo "jenkins:jenkins" | chpasswd
