FROM ubuntu:16.04
MAINTAINER Lars Bilke <lars.bilke@ufz.de>

RUN apt-get update \
  && apt-get -y install \
    build-essential \
    ccache \
    cmake \
    curl \
    doxygen \
    freeglut3-dev \
    git \
    libxml2-utils \
    libxt-dev \
    make \
    python-pip \
    python2.7 \
    time \
    vim \
    wget \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/python python /usr/bin/python2.7 100

# Add user jenkins to the image
RUN adduser --uid 500 --quiet jenkins \
  # Add user jenkins to sudoers with NOPASSWD
  && echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
  # Set password for the jenkins user (you may want to alter this).
  && RUN echo "jenkins:jenkins" | chpasswd

ENV CCACHE_DIR=/usr/src/.ccache
ENV CCACHE_MAXSIZE=15G

WORKDIR /usr/src
