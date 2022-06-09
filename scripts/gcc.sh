
GCC_VERSION=9.5.0
#wget https://github.com/gcc-mirror/gcc/archive/refs/tags/releases/gcc-${GCC_VERSION}.tar.gz -O $DEV_ENV_PACKAGE/gcc-${GCC_VERSION}.tar.gz

pushd $PWD
#cd $DEV_ENV_PACKAGE
#tar xzvf gcc-${GCC_VERSION}.tar.gz

cd $DEV_ENV_PACKAGE/gcc-releases-gcc-${GCC_VERSION}
./configure                      \
    --prefix=$DEV_ENV_PACKAGE/gcc-releases-gcc-${GCC_VERSION}/build      \
    --enable-shared                                  \
    --enable-threads=posix                           \
    --enable-__cxa_atexit                            \
    --enable-clocale=gnu                             \
    --enable-languages=c,c++                         \
&& make -j16 \
&& make install

popd
