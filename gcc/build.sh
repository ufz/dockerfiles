DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
docker build -t ogs6/gcc-dev-essentials:latest $DIR/dev-essentials
docker build -t ogs6/gcc-base:latest $DIR/base
docker build -t ogs6/gcc-gui:latest $DIR/gui
docker build -t ogs6/gcc-latex:latest $DIR/latex
docker build -t ogs5/gcc-base:latest $DIR/ogs5-base
