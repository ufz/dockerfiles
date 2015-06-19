FROM bilke/ogs-base
MAINTAINER Lars Bilke <lars.bilke@ufz.de>

# Build and install Catalyst-edition from source.
WORKDIR /usr/src
RUN git clone https://github.com/ufz/catalyst-io.git catalyst
RUN mkdir catalyst-build
WORKDIR /usr/src/catalyst-build
RUN ../catalyst/cmake.sh ../catalyst && \
  make -j$(nproc)

ENV ParaView_DIR /usr/src/catalyst-build
