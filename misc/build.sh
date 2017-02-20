DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
docker build -t ogs6/latex:latest $DIR/latex
docker build -t ogs6/ansible:latest $DIR/ansible
