FROM ogs6/clang-dev-essentials
MAINTAINER Lars Bilke <lars.bilke@ufz.de>

RUN apt-get update && apt-get install -y \
  curl \
  time \
  freeglut3-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ADD scripts/ scripts/

RUN ./scripts/install-boost.sh /usr/local/
ENV BOOST_ROOT=/usr/local/boost_1_56_0

RUN ./scripts/install-vtk.sh /usr/local 7.1

ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

RUN ./scripts/install-lis.sh 1.7.9
