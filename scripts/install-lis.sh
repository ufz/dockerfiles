#!/bin/bash
# arg 1: version

wget http://www.ssisc.org/lis/dl/lis-$1.tar.gz \
  && tar xf lis-$1.tar.gz \
  && cd lis-$1 \
  && ./configure \
  && make -j$(nproc) install \
  && cd .. && rm -rf lis-$1 lis-$1.tar.gz
