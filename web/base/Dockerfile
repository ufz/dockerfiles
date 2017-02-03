FROM node
MAINTAINER Lars Bilke <lars.bilke@ufz.de>

# Hugo
RUN wget https://github.com/spf13/hugo/releases/download/v0.18.1/hugo_0.18.1_Linux-64bit.tar.gz \
  && tar xf hugo_0.18.1_Linux-64bit.tar.gz \
  && mv hugo_0.18.1_linux_amd64/hugo_0.18.1_linux_amd64 /usr/local/bin/hugo \
  && rm -rf hugo_0.18.1_*

# Gulp
RUN npm install --global gulp-cli

# Pip
RUN apt-get update \
  && apt-get -y install \
    python-pip \
    apt-transport-https \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Yarn
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update \
  && apt-get -y --force-yes install \
    yarn \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /usr/scr
WORKDIR /usr/src
