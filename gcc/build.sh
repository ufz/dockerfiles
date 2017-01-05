DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
docker build -t ogs6/gcc-dev-essentials:latest $DIR/dev-essentials
docker build -t ogs6/gcc-conan:latest $DIR/conan
docker build -t ogs6/gcc-base:latest $DIR/base
docker build -t ogs6/gcc-gui:latest $DIR/gui
docker build -t ogs6/gcc-latex:latest $DIR/latex
docker build -t ogs6/gcc-conan-package-tools:latest $DIR/conan-package-tools
docker build -t ogs6/gcc-conan-package-tools-qt:latest $DIR/conan-package-tools-qt
docker build -t ogs5/gcc-base:latest $DIR/ogs5-base
