FROM bilke/dev-essentials
MAINTAINER Lars Bilke <lars.bilke@ufz.de>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

#// freeglut3 freeglut3-dev libglew1.5 libglew1.5-dev libglu1-mesa libglu1-mesa-dev libgl1-mesa-glx libgl1-mesa-dev mesa-common-dev
RUN apt-get install -y subversion freeglut3-dev libxmu-dev libxi-dev bison flex libjpeg-dev libpng-dev libtiff4-dev
RUN apt-get install -y vim
RUN apt-get install -y wget

RUN cvs -d:pserver:anonymous@opensg.cvs.sourceforge.net:/cvsroot/opensg login
RUN cvs -z3 -d:pserver:anonymous@opensg.cvs.sourceforge.net:/cvsroot/opensg co -P OpenSG
RUN cd OpenSG && ./configure --enable-glut --enable-tif --enable-png --enable-jpg && make
RUN RUN cd OpenSG && sudo make install
