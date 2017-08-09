FROM ogs6/gcc-dev-essentials
MAINTAINER Lars Bilke <lars.bilke@ufz.de>

ENV CONAN_UPLOAD=1 \
    CONAN_USERNAME="bilke" \
    CONAN_CHANNEL="testing" \
    CONAN_STABLE_BRANCH_PATTERN="release/*"

RUN pip install conan==0.25.1
RUN conan remote add -i 0 ogs https://api.bintray.com/conan/ogs/conan
