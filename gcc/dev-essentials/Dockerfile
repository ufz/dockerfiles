FROM ubuntu:16.04
MAINTAINER Lars Bilke <lars.bilke@ufz.de>

RUN apt-get update \
  && apt-get -y install apt-transport-https curl \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" \
     | tee /etc/apt/sources.list.d/yarn.list \
  && curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash \
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
    npm \
    pandoc-citeproc \
    python-pip \
    python2.7 \
    sudo \
    time \
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

# Hugo
RUN wget https://github.com/gohugoio/hugo/releases/download/v0.25.1/hugo_0.25.1_Linux-64bit.tar.gz \
  && tar xf hugo_0.25.1_Linux-64bit.tar.gz \
  && mv hugo /usr/local/bin/hugo \
  && rm -rf hugo_0.25.1_Linux-64bit.tar.gz LICENSE.md README.md

 # Add user jenkins to the image
RUN adduser --uid 500 --disabled-password --gecos "" jenkins \
  # Add user jenkins to sudoers with NOPASSWD
  && echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
  # Set password for the jenkins user (you may want to alter this).
  && echo "jenkins:jenkins" | chpasswd

ENV CCACHE_DIR=/usr/src/.ccache
ENV CCACHE_MAXSIZE=15G
ENV CCACHE_SLOPPINESS=pch_defines,time_macros

WORKDIR /usr/src
