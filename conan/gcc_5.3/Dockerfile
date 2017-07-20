FROM ubuntu:xenial

LABEL maintainer "lars.bilke@ufz.de"

RUN dpkg --add-architecture i386 && rm -rf /var/lib/apt/lists/* && apt-get update && apt-get install -y python-dev sudo build-essential wget git vim libc6-dev-i386 g++-multilib libgmp-dev libmpfr-dev libmpc-dev libc6-dev nasm dh-autoreconf valgrind && apt-get install -y --allow-downgrades gcc-5=5.3.1-14ubuntu2 gcc-5-base=5.3.1-14ubuntu2 cpp-5=5.3.1-14ubuntu2 libcc1-0=5.3.1-14ubuntu2 libgcc-5-dev=5.3.1-14ubuntu2 libstdc++6=5.3.1-14ubuntu2 libgomp1=5.3.1-14ubuntu2 libitm1=5.3.1-14ubuntu2 libatomic1=5.3.1-14ubuntu2 libasan2=5.3.1-14ubuntu2 liblsan0=5.3.1-14ubuntu2 libtsan0=5.3.1-14ubuntu2 libubsan0=5.3.1-14ubuntu2 libcilkrts5=5.3.1-14ubuntu2 libmpx0=5.3.1-14ubuntu2 libquadmath0=5.3.1-14ubuntu2 gcc-5-multilib=5.3.1-14ubuntu2 lib32gcc-5-dev=5.3.1-14ubuntu2 libx32gcc-5-dev=5.3.1-14ubuntu2 lib32gomp1=5.3.1-14ubuntu2 libx32gomp1=5.3.1-14ubuntu2 lib32itm1=5.3.1-14ubuntu2 libx32itm1=5.3.1-14ubuntu2 lib32atomic1=5.3.1-14ubuntu2 libx32atomic1=5.3.1-14ubuntu2 lib32asan2=5.3.1-14ubuntu2 libx32asan2=5.3.1-14ubuntu2 lib32ubsan0=5.3.1-14ubuntu2 libx32ubsan0=5.3.1-14ubuntu2 lib32cilkrts5=5.3.1-14ubuntu2 libx32cilkrts5=5.3.1-14ubuntu2 lib32mpx0=5.3.1-14ubuntu2 lib32quadmath0=5.3.1-14ubuntu2 libx32quadmath0=5.3.1-14ubuntu2 lib32stdc++6=5.3.1-14ubuntu2 libx32stdc++6=5.3.1-14ubuntu2 linux-libc-dev:i386 libstdc++-5-dev=5.3.1-14ubuntu2 && apt-get install -y --allow-downgrades g++-5=5.3.1-14ubuntu2 libstdc++-5-dev=5.3.1-14ubuntu2 g++-5-multilib=5.3.1-14ubuntu2 lib32stdc++-5-dev=5.3.1-14ubuntu2 libx32stdc++-5-dev=5.3.1-14ubuntu2 libffi-dev libssl-dev
# RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
# Install CMake 3
RUN wget https://cmake.org/files/v3.7/cmake-3.7.2-Linux-x86_64.tar.gz --no-check-certificate && tar -xzf cmake-3.7.2-Linux-x86_64.tar.gz && cp -fR cmake-3.7.2-Linux-x86_64/* /usr && rm -rf cmake-3.7.2-Linux-x86_64 && rm cmake-3.7.2-Linux-x86_64.tar.gz
RUN wget https://bootstrap.pypa.io/get-pip.py --no-check-certificate && python get-pip.py && pip install -U pip
RUN pip install pip install conan==0.25.0 conan_package_tools

# Add user jenkins to the image
RUN adduser --uid 500 --disabled-password --gecos "" jenkins \
 # Add user jenkins to sudoers with NOPASSWD
 && echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
 # Set password for the jenkins user (you may want to alter this).
 && echo "jenkins:jenkins" | chpasswd

WORKDIR /home/jenkins
USER jenkins
RUN mkdir -p /home/jenkins/.conan
