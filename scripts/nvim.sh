########################################
# neovim
########################################
#curl -fLo $HOME/.bin/nvim.appimage --create-dirs  https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
#chmod a+x $HOME/.bin/nvim.appimage
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz -O $DEV_ENV_LOCAL/nvim-linux64.tar.gz

pushd $PWD
cd $DEV_ENV_LOCAL
tar xzvf nvim-linux64.tar.gz
git clone https://github.com/ksungkeun84/neovim-config $HOME/.config/nvim
echo "#---------------------- dev-evn ---------------" >> $HOME/.zshrc
echo "alias vi=\"$DEV_ENV_LOCAL/nvim-linux64/bin/nvim\"" >> $HOME/.zshrc
echo "set -o vi" >> $HOME/.zshrc
echo "#---------------------- dev-evn ---------------" >> $HOME/.zshrc
popd
