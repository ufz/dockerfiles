DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker build -t ogs6/gcc-dev-essentials:latest -f $DIR/gcc/dev-essentials/Dockerfile $DIR
docker build -t ogs6/gcc-base:latest -f $DIR/gcc/base/Dockerfile $DIR
(cd $DIR/gcc && ./build.sh)

docker build -t ogs6/clang-dev-essentials:latest -f $DIR/clang/dev-essentials/Dockerfile $DIR
docker build -t ogs6/clang-base:latest -f $DIR/clang/base/Dockerfile $DIR

(cd $DIR/conan && ./build.sh)
(cd $DIR/mingw && ./build.sh)
(cd $DIR/misc && ./build.sh)
