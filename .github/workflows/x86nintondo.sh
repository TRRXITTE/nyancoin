
arch -x86_64 zsh

export BOOST_ROOT="$HOME/boost"
export BOOST_INCLUDEDIR="$BOOST_ROOT/include"
export BOOST_LIBDIR="$BOOST_ROOT/lib"

./autogen.sh
./configure --with-boost="$BOOST_ROOT" --with-boost-libdir="$BOOST_LIBDIR" --disable-tests || (cat config.log && false)
make -j32