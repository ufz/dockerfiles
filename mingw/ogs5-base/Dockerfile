FROM ogs6/mingw-dev-essentials
MAINTAINER Lars Bilke "lars.bilke@ufz.de"

WORKDIR /usr/src/mxe
COPY settings.mk /usr/src/mxe/
RUN make -j$(nproc)

WORKDIR /usr/src
