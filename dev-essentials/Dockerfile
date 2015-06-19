FROM gcc:4.9
MAINTAINER Lars Bilke <lars.bilke@ufz.de>

RUN apt-get update && apt-get -y install \
  rsync \
  vim && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*


# Build and install CMake from source.
WORKDIR /usr/src
RUN git clone git://cmake.org/cmake.git CMake && \
  cd CMake && \
  git checkout v3.3.0-rc2
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
  git checkout v1.5.3 && \
  python ./configure.py --bootstrap && \
  ./ninja && \
  cp ./ninja /usr/bin/
