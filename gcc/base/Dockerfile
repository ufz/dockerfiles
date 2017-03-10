FROM ogs6/gcc-dev-essentials
MAINTAINER Lars Bilke <lars.bilke@ufz.de>

RUN apt-get update && apt-get -y install libeigen3-dev \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src

ADD scripts/ scripts/

RUN ./scripts/install-boost.sh /usr/local/
ENV BOOST_ROOT=/usr/local/boost_1_56_0

RUN ./scripts/install-vtk.sh /usr/local 7.1

RUN ./scripts/install-lis.sh 1.7.9

RUN wget https://ogsstorage.blob.core.windows.net/jenkins/ogs6-lib-sources/ParaView-5.2.0-Qt4-OpenGL2-MPI-Linux-64bit.tar.gz \
  && tar xf ParaView-5.2.0-Qt4-OpenGL2-MPI-Linux-64bit.tar.gz \
  && mkdir /usr/local/opt \
  && mv ParaView-5.2.0-Qt4-OpenGL2-MPI-Linux-64bit/ /usr/local/opt/paraview \
  && rm ParaView-5.2.0-Qt4-OpenGL2-MPI-Linux-64bit.tar.gz

ENV PATH=$PATH:/usr/local/opt/paraview/bin

# Google protobuf 3
RUN apt-get update && apt-get install -y \
    autoconf \
    automake \
    libtool \
    curl \
    make \
    g++ \
    unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/google/protobuf/archive/v3.2.0.tar.gz \
  && tar xf v3.2.0.tar.gz \
  && cd protobuf-3.2.0 \
  && ./autogen.sh \
  && ./configure \
  && make -j$(nproc) \
  && sudo make install \
  && sudo ldconfig \
  && cd .. && rm -rf protobuf-3.2.0 v3.2.0.tar.gz
