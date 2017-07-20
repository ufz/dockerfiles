FROM ubuntu:wily

LABEL maintainer "lars.bilke@ufz.de"

RUN dpkg --add-architecture i386 && rm -rf /var/lib/apt/lists/* && apt-get update && apt-get install -y python-dev sudo build-essential wget git vim libc6-dev-i386 g++-multilib nasm dh-autoreconf valgrind libffi-dev libssl-dev
# RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
# Install CMake 3
RUN wget https://cmake.org/files/v3.7/cmake-3.7.2-Linux-x86_64.tar.gz --no-check-certificate && tar -xzf cmake-3.7.2-Linux-x86_64.tar.gz && cp -fR cmake-3.7.2-Linux-x86_64/* /usr && rm -rf cmake-3.7.2-Linux-x86_64 && rm cmake-3.7.2-Linux-x86_64.tar.gz
RUN wget https://bootstrap.pypa.io/get-pip.py --no-check-certificate && python get-pip.py && pip install -U pip
RUN pip install pip install conan==0.25.0 && pip install conan_package_tools

# Add user jenkins to the image
RUN adduser --uid 500 --disabled-password --gecos "" jenkins \
 # Add user jenkins to sudoers with NOPASSWD
 && echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
 # Set password for the jenkins user (you may want to alter this).
 && echo "jenkins:jenkins" | chpasswd

WORKDIR /home/jenkins
USER jenkins
RUN mkdir -p /home/jenkins/.conan
