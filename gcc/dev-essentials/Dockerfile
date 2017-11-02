FROM ubuntu:16.04
MAINTAINER Lars Bilke <lars.bilke@ufz.de>

RUN apt-get update \
  && apt-get -y install apt-transport-https curl \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" \
     | tee /etc/apt/sources.list.d/yarn.list \
  && curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash \
  && curl -s https://deb.nodesource.com/setup_6.x | bash \
  && apt-get update \
  && apt-get -y install \
    ccache \
    cmake \
    curl \
    doxygen \
    freeglut3-dev \
    gcc-4.9 \
    g++-4.9 \
    gcc-4.9-base \
    graphviz \
    git \
    git-lfs \
    libxml2-utils \
    libxt-dev \
    make \
    nodejs \
    pandoc-citeproc \
    python-pip \
    python2.7 \
    sudo \
    time \
    unzip \
    vim \
    wget \
    yarn \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip

RUN  update-alternatives --install /usr/bin/python python /usr/bin/python2.7 100 \
  && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 100 \
  && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 100 \
  && update-alternatives --install /usr/bin/gcov gcov /usr/bin/gcov-4.9 100 \
  && update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10

# Ninja
RUN wget https://github.com/ninja-build/ninja/releases/download/v1.8.2/ninja-linux.zip \
  && unzip ninja-linux.zip \
  && mv ninja /usr/local/bin/ninja \
  && rm ninja-linux.zip

# Hugo
RUN wget https://github.com/gohugoio/hugo/releases/download/v0.27.1/hugo_0.27.1_Linux-64bit.tar.gz \
  && tar xf hugo_0.27.1_Linux-64bit.tar.gz \
  && mv hugo /usr/local/bin/hugo \
  && rm -rf hugo_0.27.1_Linux-64bit.tar.gz LICENSE.md README.md

 # Add user jenkins to the image
RUN adduser --uid 500 --disabled-password --gecos "" jenkins \
  # Add user jenkins to sudoers with NOPASSWD
  && echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
  # Set password for the jenkins user (you may want to alter this).
  && echo "jenkins:jenkins" | chpasswd

USER jenkins
ENV CCACHE_DIR=/usr/src/.ccache
ENV CCACHE_MAXSIZE=15G
ENV CCACHE_SLOPPINESS=pch_defines,time_macros
USER root

WORKDIR /usr/src
