FROM ubuntu:16.04
MAINTAINER Lars Bilke <lars.bilke@ufz.de>

RUN apt-get update \
  && apt-get -y install apt-transport-https curl \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" \
     | tee /etc/apt/sources.list.d/yarn.list \
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
    libxml2-utils \
    libxt-dev \
    make \
    nodejs \
    npm \
    python-pip \
    python2.7 \
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
  && update-alternatives --install /usr/bin/gcov gcov /usr/bin/gcov-4.9 100

# Hugo
RUN wget https://github.com/spf13/hugo/releases/download/v0.18.1/hugo_0.18.1_Linux-64bit.tar.gz \
  && tar xf hugo_0.18.1_Linux-64bit.tar.gz \
  && mv hugo_0.18.1_linux_amd64/hugo_0.18.1_linux_amd64 /usr/local/bin/hugo \
  && rm -rf hugo_0.18.1_*

# Add user jenkins to the image
RUN adduser --uid 500 --quiet jenkins \
  # Add user jenkins to sudoers with NOPASSWD
  && echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
  # Set password for the jenkins user (you may want to alter this).
  && RUN echo "jenkins:jenkins" | chpasswd

ENV CCACHE_DIR=/usr/src/.ccache
ENV CCACHE_MAXSIZE=15G

WORKDIR /usr/src
