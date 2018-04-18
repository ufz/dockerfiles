FROM lasote/conangcc7
LABEL maintainer="lars.bilke@ufz.de"

# Add user jenkins to the image
USER root
RUN adduser --uid 500 --disabled-password --gecos "" jenkins \
  # Add user jenkins to sudoers with NOPASSWD
  && echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
  # Set password for the jenkins user (you may want to alter this).
  && echo "jenkins:jenkins" | chpasswd
RUN pip install -q --no-cache-dir --upgrade conan

USER jenkins
WORKDIR /home/jenkins
RUN mkdir -p /home/jenkins/.conan
