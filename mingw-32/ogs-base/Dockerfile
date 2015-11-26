FROM ogs6/mingw-32-gcc
MAINTAINER Lars Bilke "lars.bilke@ufz.de"

WORKDIR /usr/src/mxe
COPY settings.mk /usr/src/mxe/
COPY vtk6-no-qt.mk /usr/src/mxe/src/vtk6.mk
RUN make -j$(nproc)

# Add user jenkins to the image
RUN adduser --uid 500 --quiet jenkins

# Add user jenkins to sudoers with NOPASSWD
RUN echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Set password for the jenkins user (you may want to alter this).
RUN echo "jenkins:jenkins" | chpasswd

WORKDIR /usr/src
