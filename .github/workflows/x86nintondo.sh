
arch -x86_64 zsh

export BOOST_ROOT="$HOME/x86/boost"
export BOOST_INCLUDEDIR="$BOOST_ROOT/include"
export BOOST_LIBDIR="$BOOST_ROOT/lib"
export CPPFLAGS="-I/Users/traaitt/x86/boost/include -DHAVE_BUILD_INFO -D__STDC_FORMAT_MACROS -DMAC_OSX -DOBJC_OLD_DISPATCH_PROTOTYPES=0"
export LDFLAGS="-L/Users/traaitt/x86/boost/lib -Wl,-headerpad_max_install_names -Wl,-dead_strip"
export BOOST_CPPFLAGS="-I/Users/traaitt/x86/boost/include"
export BOOST_LDFLAGS="-L/Users/traaitt/x86/boost/lib"



./autogen.sh
./configure --with-boost="$BOOST_ROOT" --with-boost-libdir="$BOOST_LIBDIR" --disable-tests || (cat config.log && false)
make -j32