#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
docker build $1 -t ogs6/gcc-conan:latest $DIR/conan
docker build $1 -t ogs6/gcc-gui:latest $DIR/gui
docker build $1 -t ogs6/gcc-conan-package-tools:latest $DIR/conan-package-tools
docker build $1 -t ogs6/gcc-conan-package-tools-qt:latest $DIR/conan-package-tools-qt
docker build $1 -t ogs5/gcc-base:latest $DIR/ogs5-base
