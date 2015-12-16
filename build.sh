docker build -t ogs6/gcc-dev-essentials:latest gcc/dev-essentials
docker build -t ogs6/gcc-ogs-base:latest gcc/ogs-base
docker build -t ogs6/gcc-ogs-gui:latest gcc/ogs-gui

docker build -t ogs6/clang-dev-essentials:latest clang/dev-essentials
docker build -t ogs6/clang-ogs-base:latest clang/ogs-base

docker build -t ogs6/mingw-dev-essentials:latest mingw/dev-essentials
docker build -t ogs6/mingw-gcc:latest mingw/gcc
docker build -t ogs6/mingw-ogs-gui:latest mingw/ogs-gui

docker build -t ogs6/mingw-32-gcc:latest mingw-32/gcc
docker build -t ogs6/mingw-32-ogs-base:latest mingw-32/ogs-base

docker build -t ogs5/gcc-ogs-base:latest gcc/ogs5-base
