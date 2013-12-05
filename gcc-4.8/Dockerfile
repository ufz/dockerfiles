FROM ubuntu
MAINTAINER Lars Bilke <lars.bilke@ufz.de>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

#// Add the Ubuntu Toolchain PPA.
RUN apt-get install -y python-software-properties
RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt-get update

#// Install build-essential, but replace compilers with 4.8.
#// http://packages.ubuntu.com/precise/build-essential

RUN apt-get install -y build-essential gcc-4.8 g++-4.8

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 50
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 50
