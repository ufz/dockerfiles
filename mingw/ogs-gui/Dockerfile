FROM thewtex/cross-compiler-base
MAINTAINER Lars Bilke "lars.bilke@ufz.de"

# WINE is used as an emulator for try_run and tests with CMake.
# Other dependencies are from the listed MXE requirements:
#   http://mxe.cc/#requirements
# 'cmake' is omitted because it is installed from source in the base image
RUN apt-get update && apt-get -y install \
  autoconf \
  automake \
  autopoint \
  bash \
  bison \
  bzip2 \
  flex \
  gettext \
  git \
  g++ \
  g++-multilib \
  gperf \
  intltool \
  libffi-dev \
  libtool-bin \
  libltdl-dev \
  libssl-dev \
  libxml-parser-perl \
  libc6-dev-i386 \
  make \
  openssl \
  patch \
  perl \
  pkg-config \
  python \
  ruby \
  scons \
  sed \
  unzip \
  wget \
  wine \
  xz-utils && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Set up wine
RUN dpkg --add-architecture i386 && \
  apt-get update && \
  apt-get install -y wine32 && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
ENV WINEARCH win64
RUN wine hostname

WORKDIR /usr/src
# mxe master prior to mingw-w64 update, based on GCC 4
# with boost fix (a8df43d1)
RUN git clone https://github.com/mxe/mxe.git && \
  cd mxe && \
  git checkout a8df43d1
WORKDIR /usr/src/mxe
COPY settings.mk /usr/src/mxe/
RUN make -j$(nproc)

ENV PATH ${PATH}:/usr/src/mxe/usr/bin
ENV CMAKE_TOOLCHAIN_FILE /usr/src/mxe/usr/x86_64-w64-mingw32.static/share/cmake/mxe-conf.cmake
RUN echo 'set(CMAKE_CROSSCOMPILING_EMULATOR "/usr/bin/wine")' >> ${CMAKE_TOOLCHAIN_FILE}

WORKDIR /usr/src
