FROM ubuntu:14.04
MAINTAINER Lars Bilke <lars.bilke@ufz.de>

RUN echo "deb http://pkg.mxe.cc/repos/apt/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mxeapt.list \
  && apt-key adv --keyserver x-hkp://keys.gnupg.net --recv-keys D43A795B73B16ABE9643FE1AFD8FFF16DB45C6AB

RUN apt-get update && apt-get -y install \
  git \
  wget \
  rsync \
  vim \
  mxe-x86-64-w64-mingw32.static-gcc \
  mxe-x86-64-w64-mingw32.static-dlfcn \
  mxe-i686-w64-mingw32.static-gcc \
  mxe-i686-w64-mingw32.static-dlfcn \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ENV CMAKE_TOOLCHAIN_FILE /usr/lib/mxe/usr/x86_64-w64-mingw32.static/share/cmake/mxe-conf.cmake
ENV CMAKE_TOOLCHAIN_FILE_32 /usr/lib/mxe/usr/i686-w64-mingw32.static/share/cmake/mxe-conf.cmake

WORKDIR /usr/src

# Build and install CMake from source.
RUN wget https://cmake.org/files/v3.4/cmake-3.4.2.tar.gz \
  && tar -xvf cmake-3.4.2.tar.gz \
  && cd cmake-3.4.2 \
  && ./bootstrap \
  && make -j$(nproc) \
  && make install \
  && rm -rf * \
  && cd .. && rm -rf cmake-*
