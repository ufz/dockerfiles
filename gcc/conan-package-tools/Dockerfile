FROM ogs6/gcc-dev-essentials
LABEL maintainer="lars.bilke@ufz.de"

ENV CONAN_USERNAME="bilke" \
    CONAN_CHANNEL="testing" \
    CONAN_STABLE_BRANCH_PATTERN="release/*"

RUN pip install conan==0.27.0
RUN pip install conan_package_tools

USER jenkins
WORKDIR /home/jenkins

RUN conan user
RUN conan remote add -i 0 ogs https://ogs.jfrog.io/ogs/api/conan/conan
