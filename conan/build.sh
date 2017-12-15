#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
docker build $1 -t ogs6/conangcc5:latest $DIR/gcc_5
docker build $1 -t ogs6/conangcc6:latest $DIR/gcc_6
docker build $1 -t ogs6/conangcc7:latest $DIR/gcc_7

docker build $1 -t ogs6/conangcc49:latest $DIR/gcc_4.9
