#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
docker build $1 -t ogs6/latex:latest $DIR/latex
docker build $1 -t ogs6/ansible:latest $DIR/ansible
