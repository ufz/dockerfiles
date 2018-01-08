FROM ogs6/clang-dev-essentials
MAINTAINER Lars Bilke <lars.bilke@ufz.de>

RUN sudo apt-get update && apt-get install -y \
  curl \
  time \
  freeglut3-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ADD scripts/ scripts/
ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
RUN ./scripts/install-lis.sh 1.7.9
