FROM ogs6/mingw-dev-essentials
MAINTAINER Lars Bilke "lars.bilke@ufz.de"

RUN apt-get update && apt-get -y install \
  mxe-x86-64-w64-mingw32.static-boost \
  mxe-x86-64-w64-mingw32.static-pthreads \
  mxe-x86-64-w64-mingw32.static-vtk6 \
  mxe-i686-w64-mingw32.static-boost \
  mxe-i686-w64-mingw32.static-pthreads \
  mxe-i686-w64-mingw32.static-vtk6 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
