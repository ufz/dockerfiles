FROM ogs6/gcc-dev-essentials
MAINTAINER Lars Bilke <lars.bilke@ufz.de>

RUN apt-get update && apt-get -y install libeigen3-dev \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src
RUN curl -L -o boost_1_56_0.tar.bz2 https://ogsstorage.blob.core.windows.net/jenkins/ogs6-lib-sources/boost_1_56_0.tar.bz2 && \
  tar -xjf boost_1_56_0.tar.bz2 && \
  chmod 755 boost_1_56_0 && \
  rm boost_1_56_0.tar.bz2
ENV BOOST_ROOT=/usr/src/boost_1_56_0

RUN wget http://www.vtk.org/files/release/6.3/VTK-6.3.0.tar.gz && \
  tar xf VTK-6.3.0.tar.gz && \
  rm VTK-6.3.0.tar.gz \
  && mkdir vtk-build && cd vtk-build \
  && cmake ../VTK-6.3.0 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr/local \
    -DBUILD_TESTING=OFF \
    -DModule_vtkIOParallelXML=ON \
  && make -j$(nproc) install \
  && cd .. && rm -rf vtk-build VTK-6.3.0

RUN wget http://www.ssisc.org/lis/dl/lis-1.7.9.tar.gz \
  && tar xf lis-1.7.9.tar.gz \
  && cd lis-1.7.9 \
  && ./configure \
  && make -j$(nproc) install \
  && cd .. && rm -rf lis-1.7.9 lis-1.7.9.tar.gz

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
