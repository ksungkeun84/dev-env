export DEV_ENV_PACKAGE_ROOT=$PWD/packages
export DEV_ENV_SCRIPT_ROOT=$PWD/scripts
export DEV_ENV_ROOT=$PWD
if [[ ! -d "$DEV_ENV_PACKAGE_ROOT" ]]; then
    echo "Creating package directory"
    mkdir -p "$DEV_ENV_PACKAGE_ROOT"
fi
if [[ ! -d "$DEV_ENV_SCRIPT_ROOT" ]]; then
    echo "Creating script directory"
    mkdir -p "$DEV_ENV_SCRIPT_ROOT"
fi

########################################
# Install ncurses and zsh
########################################
wget ftp://ftp.gnu.org/gnu/ncurses/ncurses-6.1.tar.gz -O $DEV_ENV_PACKAGE_ROOT/ncurses-6.1.tar.gz
cd $DEV_ENV_PACKAGE_ROOT
tar xf ncurses-6.1.tar.gz
cd ncurses-6.1
./configure --prefix=$DEV_ENV_ROOT/local CXXFLAGS="-fPIC" CFLAGS="-fPIC"
make -j && make install
cd $DEV_ENV_ROOT



ZSH_SRC_NAME=$DEV_ENV_PACKAGE_ROOT/zsh.tar.xz
ZSH_PACK_DIR=$DEV_ENV_PACKAGE_ROOT/zsh
ZSH_LINK="https://sourceforge.net/projects/zsh/files/latest/download"

if [[ ! -d "$ZSH_PACK_DIR" ]]; then
    echo "Creating zsh directory under packages directory"
    mkdir -p "$ZSH_PACK_DIR"
fi

if [[ ! -f $ZSH_SRC_NAME ]]; then
    curl -Lo "$ZSH_SRC_NAME" "$ZSH_LINK"
fi

tar xJvf "$ZSH_SRC_NAME" -C "$ZSH_PACK_DIR" --strip-components 1
cd "$ZSH_PACK_DIR"

./configure --prefix="$DEV_ENV_ROOT/local" \
    CPPFLAGS="-I$DEV_ENV_ROOT/local/include" \
    LDFLAGS="-L$DEV_ENV_ROOT/local/lib"
make -j && make install

echo "#---------------------- dev-evn ---------------" >> $HOME/.bash_profile
echo "export PATH=$DEV_ENV_ROOT/local/bin:$PATH" >> $HOME/.bash_profile
echo "export SHELL=\`which zsh\`" >> $HOME/.bash_profile
echo "[ -f \$SHELL ] && exec \$SHELL -l" >> $HOME/.bash_profile
echo "#---------------------- dev-evn ---------------" >> $HOME/.bash_profile
cd "$DEV_ENV_ROOT"

