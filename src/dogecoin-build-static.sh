
arch -x86_64 zsh -c '
cd /Users/traaitt/Documents/GitHub/nyancoin

PREFIX="$HOME/x86"
export PKG_CONFIG_LIBDIR="$PREFIX/lib/pkgconfig"
export PKG_CONFIG_PATH="$PKG_CONFIG_LIBDIR"
export PATH="$PREFIX/bin:/usr/local/bin:$PATH"
export CPP="/usr/bin/cpp"
export BOOST_ROOT="$PREFIX" BOOST_INCLUDEDIR="$PREFIX/include" BOOST_LIBDIR="$PREFIX/lib"
export OPENSSL_PREFIX="$PREFIX" BDB_PREFIX="$PREFIX" LIBEVENT_PREFIX="$PREFIX" ZMQ_PREFIX="$PREFIX"
export CPPFLAGS="-I$PREFIX/include -std=c++14"
export LDFLAGS="-L$PREFIX/lib -Wl,-rpath,$PREFIX/lib"

./autogen.sh
./configure --with-boost-libdir="$BOOST_LIBDIR" \
  --with-ssl="$OPENSSL_PREFIX" --with-libevent="$LIBEVENT_PREFIX" \
  --with-zmq="$ZMQ_PREFIX" --with-bdb="$BDB_PREFIX" \
  --with-qrencode="$PREFIX" --disable-tests --disable-bench

make clean
make -j10
'
