FROM ubuntu
MAINTAINER Lars Bilke <lars.bilke@ufz.de>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

#// Git, Vim, CMake, GCC
RUN apt-get install -y git
RUN apt-get install -y vim
RUN apt-get install -y wget
RUN wget https://launchpad.net/ubuntu/+source/cmake/2.8.8-2ubuntu1/+build/3441442/+files/cmake_2.8.8-2ubuntu1_amd64.deb
RUN wget https://launchpad.net/ubuntu/+archive/primary/+files/cmake-data_2.8.8-2ubuntu1_all.deb
RUN apt-get remove cmake-data cmake
RUN apt-get install -y emacsen-common libarchive12 libxmlrpc-core-c3
RUN dpkg --install cmake-data_2.8.8-2ubuntu1_all.deb cmake_2.8.8-2ubuntu1_amd64.deb
RUN apt-get install -y build-essential

