wget ftp://ftp.gnu.org/gnu/ncurses/ncurses-6.1.tar.gz -O $DEV_ENV_PACKAGE/ncurses-6.1.tar.gz
pushd $PWD
cd $DEV_ENV_PACKAGE_ROOT
tar xf ncurses-6.1.tar.gz
cd ncurses-6.1
./configure --prefix=$DEV_ENV_LOCAL CXXFLAGS="-fPIC" CFLAGS="-fPIC"
make -j16 && make install
popd
