FROM ogs6/gcc-gui
MAINTAINER Lars Bilke <lars.bilke@ufz.de>

RUN apt-get update \
  && apt-get -y install curl \
  && curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash \
  && apt-get update \
  && apt-get install -y \
    biber \
    git-lfs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src
