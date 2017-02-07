DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
(cd $DIR/clang && ./build.sh)
(cd $DIR/gcc && ./build.sh)
(cd $DIR/mingw && ./build.sh)
(cd $DIR/misc && ./build.sh)
