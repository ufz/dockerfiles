FROM ogs6/gcc-dev-essentials
MAINTAINER Lars Bilke <lars.bilke@ufz.de>

RUN pip install conan==0.25.1

USER jenkins

ENV CONAN_UPLOAD=1 \
    CONAN_USERNAME="bilke" \
    CONAN_CHANNEL="testing" \
    CONAN_STABLE_BRANCH_PATTERN="release/*"

RUN conan remote add -i 0 ogs https://api.bintray.com/conan/ogs/conan
