#!/bin/bash
curl -L -o boost_1_56_0.tar.gz https://github.com/boostorg/boost/archive/boost-1.56.0.tar.gz && \
  tar -xf boost_1_56_0.tar.gz && \
  chmod 755 boost-boost-1.56.0 && \
  mv boost-boost-1.56.0 boost_1_56_0
  mv boost_1_56_0 $1 && \
  rm boost_1_56_0.tar.gz
