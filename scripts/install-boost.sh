#!/bin/bash
curl -L -o boost_1_56_0.tar.bz2 https://ogsstorage.blob.core.windows.net/jenkins/ogs6-lib-sources/boost_1_56_0.tar.bz2 && \
  tar -xjf boost_1_56_0.tar.bz2 && \
  chmod 755 boost_1_56_0 && \
  mv boost_1_56_0 $1 && \
  rm boost_1_56_0.tar.bz2
