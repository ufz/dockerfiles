DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
docker build -t ogs6/conangcc46:latest $DIR/gcc_4.6
docker build -t ogs6/conangcc48:latest $DIR/gcc_4.8
docker build -t ogs6/conangcc49:latest $DIR/gcc_4.9
docker build -t ogs6/conangcc52:latest $DIR/gcc_5.2
docker build -t ogs6/conangcc53:latest $DIR/gcc_5.3
docker build -t ogs6/conangcc54:latest $DIR/gcc_5.4
docker build -t ogs6/conangcc62:latest $DIR/gcc_6.2
docker build -t ogs6/conangcc63:latest $DIR/gcc_6.3
