FROM ogs6/clang-dev-essentials
MAINTAINER Lars Bilke <lars.bilke@ufz.de>

RUN apt-get update && apt-get install -y \
  curl \
  time \
  freeglut3-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src
RUN curl -L -o boost_1_56_0.tar.bz2 https://ogsstorage.blob.core.windows.net/jenkins/ogs6-lib-sources/boost_1_56_0.tar.bz2 && \
  tar -xjf boost_1_56_0.tar.bz2 && \
  chmod 755 boost_1_56_0 && \
  rm boost_1_56_0.tar.bz2
ENV BOOST_ROOT=/usr/src/boost_1_56_0

WORKDIR /usr/src
RUN wget http://www.vtk.org/files/release/6.3/VTK-6.3.0.tar.gz && \
  tar xf VTK-6.3.0.tar.gz && \
  rm VTK-6.3.0.tar.gz
RUN mkdir vtk-build
WORKDIR /usr/src/vtk-build
RUN cmake ../VTK-6.3.0 \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr/local \
  -DBUILD_TESTING=OFF \
  -DModule_vtkIOParallelXML=ON && \
  make -j$(nproc) install && make clean

WORKDIR /usr/src
RUN rm -rf vtk-build VTK-6.3.0

ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

RUN wget http://www.ssisc.org/lis/dl/lis-1.7.9.tar.gz && \
  && tar xf lis-1.7.9.tar.gz \
  && cd lis-1.7.9 \
  && ./configure \
  && make -j$(nproc) install \
  && cd .. && rm -rf lis-1.7.9 lis-1.7.9.tar.gz
