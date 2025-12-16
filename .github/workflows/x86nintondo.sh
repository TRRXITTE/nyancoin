
#!/usr/bin/env zsh

# Force Intel toolchain/libs so we do not accidentally link against arm64 Homebrew
arch -x86_64 true
export PATH="/usr/local/bin:$PATH"

# Homebrew (Intel) dependency prefixes
BREW_PREFIX="/usr/local"
OPENSSL_PREFIX="$BREW_PREFIX/opt/openssl@3"
BDB_PREFIX="$BREW_PREFIX/opt/berkeley-db@5"
ZMQ_PREFIX="$BREW_PREFIX/opt/zmq"
MINIUPNPC_PREFIX="$BREW_PREFIX/opt/miniupnpc"
QRENCODE_PREFIX="$BREW_PREFIX/opt/qrencode"

# Boost built for x86_64 and kept outside Homebrew
export BOOST_ROOT="$HOME/x86/boost"
export BOOST_INCLUDEDIR="$BOOST_ROOT/include"
export BOOST_LIBDIR="$BOOST_ROOT/lib"

# Prefer Intel pkg-config metadata so configure picks the right libs
export PKG_CONFIG_PATH="${OPENSSL_PREFIX}/lib/pkgconfig:${BDB_PREFIX}/lib/pkgconfig:${ZMQ_PREFIX}/lib/pkgconfig:${MINIUPNPC_PREFIX}/lib/pkgconfig:${QRENCODE_PREFIX}/lib/pkgconfig:${PKG_CONFIG_PATH}"

# Compiler/linker flags pinned to x86_64 and Intel Homebrew paths
export CPPFLAGS="-I${BOOST_INCLUDEDIR} -I${OPENSSL_PREFIX}/include -I${BDB_PREFIX}/include -I${ZMQ_PREFIX}/include -I${MINIUPNPC_PREFIX}/include -I${QRENCODE_PREFIX}/include -DHAVE_BUILD_INFO -D__STDC_FORMAT_MACROS -DMAC_OSX -DOBJC_OLD_DISPATCH_PROTOTYPES=0"
export LDFLAGS="-L${BOOST_LIBDIR} -L${OPENSSL_PREFIX}/lib -L${BDB_PREFIX}/lib -L${ZMQ_PREFIX}/lib -L${MINIUPNPC_PREFIX}/lib -L${QRENCODE_PREFIX}/lib -Wl,-headerpad_max_install_names -Wl,-dead_strip"
export BOOST_CPPFLAGS="-I${BOOST_INCLUDEDIR}"
export BOOST_LDFLAGS="-L${BOOST_LIBDIR}"

# Build steps (all forced through x86_64)
arch -x86_64 ./autogen.sh
arch -x86_64 ./configure CC="clang -arch x86_64" CXX="clang++ -arch x86_64" --with-boost="${BOOST_ROOT}" --with-boost-libdir="${BOOST_LIBDIR}" --disable-tests || (cat config.log && false)
arch -x86_64 make -j32
