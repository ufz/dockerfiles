FROM ogs6/gcc-dev-essentials
LABEL maintainer="lars.bilke@ufz.de"

RUN pip install conan==0.29.0

USER jenkins

ENV CONAN_USERNAME="bilke" \
    CONAN_CHANNEL="testing" \
    CONAN_STABLE_BRANCH_PATTERN="release/*" \
    CC=gcc

RUN conan remote add -i 0 ogs https://ogs.jfrog.io/ogs/api/conan/conan
