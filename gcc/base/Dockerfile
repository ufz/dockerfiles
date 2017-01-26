FROM ogs6/gcc-dev-essentials
MAINTAINER Lars Bilke <lars.bilke@ufz.de>

RUN apt-get update && apt-get -y install libeigen3-dev \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src
RUN curl -L -o boost_1_56_0.tar.gz http://sourceforge.net/projects/boost/files/boost/1.56.0/boost_1_56_0.tar.gz/download && \
  tar -xzf boost_1_56_0.tar.gz && \
  chmod 755 boost_1_56_0 && \
  rm boost_1_56_0.tar.gz
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
  && cd .. && rm -rf lis-1.7.9
