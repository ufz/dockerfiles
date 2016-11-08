DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
(cd $DIR/clang && ./push.sh)
(cd $DIR/gcc && ./push.sh)
(cd $DIR/mingw && ./push.sh)
(cd $DIR/misc && ./push.sh)
