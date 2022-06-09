ZSH_SRC_NAME=$DEV_ENV_PACKAGE/zsh/zsh.tar.xz
ZSH_PACK_DIR=$DEV_ENV_PACKAGE/zsh
ZSH_LINK="https://sourceforge.net/projects/zsh/files/latest/download"

if [[ ! -d "$ZSH_PACK_DIR" ]]; then
    echo "Creating zsh directory under packages directory"
    mkdir -p "$ZSH_PACK_DIR"
fi

if [[ ! -f $ZSH_SRC_NAME ]]; then
    curl -Lo "$ZSH_SRC_NAME" "$ZSH_LINK" -k
fi

pushd $PWD
echo "$ZSH_PACK_DIR"
cd "$ZSH_PACK_DIR"
echo $PWD
tar xJvf "$ZSH_SRC_NAME" -C "$ZSH_PACK_DIR" --strip-components 1

./configure --prefix="$DEV_ENV_LOCAL/zsh" \
    CPPFLAGS="-I$DEV_ENV_LOCAL/zsh/include" \
    LDFLAGS="-L$DEV_ENV_LOCAL/zsh/lib"
make -j16 && make install

echo "#---------------------- dev-evn ---------------" >> $HOME/.bash_profile
echo "export PATH=$DEV_ENV_LOCAL/zsh/bin:$PATH" >> $HOME/.bash_profile
echo "export SHELL=\`which zsh\`" >> $HOME/.bash_profile
echo "[ -f \$SHELL ] && exec \$SHELL -l" >> $HOME/.bash_profile
echo "#---------------------- dev-evn ---------------" >> $HOME/.bash_profile

source ~/.bash_profile

rm -rf $DEV_ENV_PACKAGE/zsh
popd
