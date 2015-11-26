FROM ogs6/mingw-dev-essentials
MAINTAINER Lars Bilke "lars.bilke@ufz.de"

WORKDIR /usr/src/mxe
COPY settings.mk /usr/src/mxe/
RUN make -j$(nproc)

ENV PATH ${PATH}:/usr/src/mxe/usr/bin
ENV CMAKE_TOOLCHAIN_FILE /usr/src/mxe/usr/i686-w64-mingw32.static/share/cmake/mxe-conf.cmake
RUN echo 'set(CMAKE_CROSSCOMPILING_EMULATOR "/usr/bin/wine")' >> ${CMAKE_TOOLCHAIN_FILE}
ENV WINEARCH win32
RUN wine hostname
