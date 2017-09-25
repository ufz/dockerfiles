#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
docker build $1 -t ogs6/mingw-dev-essentials:latest $DIR/dev-essentials
docker build $1 -t ogs6/mingw-base:latest $DIR/base
