DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
docker build -t ogs6/clang-dev-essentials:latest $DIR/dev-essentials
docker build -t ogs6/clang-base:latest $DIR/base
