FROM ubuntu:16.04
LABEL maintainer="lars.bilke@ufz.de"

RUN apt-get update && apt-get install -y \
  software-properties-common \
  --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*

RUN apt-add-repository ppa:ansible/ansible

RUN apt-get update && apt-get install -y \
  ansible \
  --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*

RUN easy_install -U pip && pip install ansible[azure]

# Add user jenkins to the image
RUN adduser --uid 500 --disabled-password --gecos "" jenkins \
  # Add user jenkins to sudoers with NOPASSWD
  && echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
  # Set password for the jenkins user (you may want to alter this).
  && echo "jenkins:jenkins" | chpasswd

USER jenkins
WORKDIR /home/jenkins
