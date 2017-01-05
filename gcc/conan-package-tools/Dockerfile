FROM ogs6/gcc-dev-essentials
MAINTAINER Lars Bilke <lars.bilke@ufz.de>

ENV CONAN_UPLOAD=1 \
    CONAN_USERNAME="bilke" \
    CONAN_CHANNEL="testing" \
    CONAN_STABLE_BRANCH_PATTERN="release/*"

RUN pip install conan_package_tools
RUN conan user
