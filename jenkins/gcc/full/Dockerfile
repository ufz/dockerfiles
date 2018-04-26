FROM jenkins/ssh-slave

USER root

#RUN sh -c "echo deb http://ftp.us.debian.org/debian/ jessie main contrib non-free > /etc/apt/sources.list"
#RUN sh -c "echo deb-src http://ftp.us.debian.org/debian/ jessie main contrib non-free > /etc/apt/sources.list"

RUN apt-get update && apt-get install -y curl \
  && curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
RUN apt-get update \
  && apt-get -y install \
    ccache \
    gcc \
    git \
    git-lfs \
    python-pip \
    sudo \
    unzip

RUN python -m pip install --upgrade pip \
  && python -m pip install cmake conan>=1.2.3

# Ninja
RUN curl -L -o ninja-linux.zip https://github.com/ninja-build/ninja/releases/download/v1.8.2/ninja-linux.zip \
  && unzip ninja-linux.zip \
  && mv ninja /usr/local/bin/ninja \
  && rm ninja-linux.zip

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" \
     | tee /etc/apt/sources.list.d/yarn.list \
  && curl -s https://deb.nodesource.com/setup_8.x | bash \
  && apt-get update && apt-get install -y \
    biber \
    clang-tidy \
    cppcheck \
    doxygen \
    graphviz \
    libxml2-utils \
    nodejs \
    yarn

RUN update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10

# Hugo
RUN curl -L -o hugo.tar.gz https://github.com/gohugoio/hugo/releases/download/v0.36.1/hugo_0.36.1_Linux-64bit.tar.gz \
  && tar xf hugo.tar.gz \
  && mv hugo /usr/local/bin/hugo \
  && rm -rf hugo.tar.gz LICENSE.md README.md

# Pandoc
RUN curl -L -o pandoc.deb https://github.com/jgm/pandoc/releases/download/2.1.1/pandoc-2.1.1-1-amd64.deb \
  && sudo dpkg -i pandoc.deb \
  && rm pandoc.deb

# Include-what-you-use
RUN curl https://include-what-you-use.org/downloads/include-what-you-use-0.8-x86_64-linux-gnu-ubuntu-16.04.tar.gz -O \
  && tar xf include-what-you-use-0.8-x86_64-linux-gnu-ubuntu-16.04.tar.gz -C /usr/ --strip-components=1 \
  && rm include-what-you-use-0.8-x86_64-linux-gnu-ubuntu-16.04.tar.gz

RUN echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER jenkins

ENV CCACHE_DIR=/home/jenkins/cache/ccache
RUN mkdir -p $CCACHE_DIR
ENV CCACHE_MAXSIZE=15G
ENV CCACHE_SLOPPINESS=pch_defines,time_macros
ENV CONAN_USER_HOME=/home/jenkins/cache/conan
RUN conan user

COPY setup-sshd /usr/local/bin/setup-sshd
