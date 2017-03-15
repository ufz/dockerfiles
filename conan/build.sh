DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
docker build -t ogs6/conangcc46:latest $DIR/gcc_4.6
docker build -t ogs6/conangcc48:latest $DIR/gcc_4.8
docker build -t ogs6/conangcc49:latest $DIR/gcc_4.9
