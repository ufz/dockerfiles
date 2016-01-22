DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
docker build -t ogs6/mingw-dev-essentials:latest $DIR/dev-essentials
docker build -t ogs6/mingw-base:latest $DIR/base
