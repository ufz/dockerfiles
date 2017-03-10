#!/bin/bash
# arg 1: install prefix
# arg 2: vtk version x.x
wget http://www.vtk.org/files/release/$2/VTK-$2.0.tar.gz && \
  tar xf VTK-$2.0.tar.gz && \
  rm VTK-$2.0.tar.gz \
  && mkdir vtk-build && cd vtk-build \
  && cmake ../VTK-$2.0 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$1 \
    -DBUILD_TESTING=OFF \
    -DModule_vtkIOParallelXML=ON \
  && make -j$(nproc) install \
  && cd .. && rm -rf vtk-build VTK-$2.0
