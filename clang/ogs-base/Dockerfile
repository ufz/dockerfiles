FROM ogs6/clang-dev-essentials
MAINTAINER Lars Bilke <lars.bilke@ufz.de>

RUN apt-get update && apt-get install -y \
  libboost-dev \
  libboost-date-time-dev \
  libboost-filesystem-dev \
  libboost-program-options-dev \
  libboost-system-dev \
  libeigen3-dev \
  freeglut3-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

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
