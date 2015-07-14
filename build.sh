docker build -t ogs6/gcc-dev-essentials gcc/dev-essentials
docker build -t ogs6/gcc-ogs-base gcc/ogs-base
docker build -t ogs6/gcc-ogs-cli gcc/ogs-cli
docker build -t ogs6/gcc-ogs-gui gcc/ogs-gui

docker build -t ogs6/clang-dev-essentials clang/dev-essentials

docker build -t ogs6/mingw-ogs-gui mingw/ogs-gui
