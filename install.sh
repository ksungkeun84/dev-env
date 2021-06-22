#!/bin/bash

# install nvim
wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod u+x nvim.appimage
mkdir -p $HOME/.bin/nvim
mv nvim.appimage $HOME/.bin/nvim
echo "alias vi="nvim.appimage"" >> $HOME/.bashrc

# copy init.vim
mkdir -p ~/.config/nvim
cp init.vim $HOME/.config/nvim/

# install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# install node.js (including npm and node)
wget https://nodejs.org/dist/v14.17.1/node-v14.17.1-linux-x64.tar.xz
tar xvf node-v14.17.1-linux-x64.tar.xz
mv node-v14.17.1-linux-x64 $HOME/.bin/
rm node-v14.17.1-linux-x64.tar.xz

echo "export PATH=$HOME/.bin/node-v14.17.1-linux-x64/bin:$HOME/.bin/nvm:$PATH" >> $HOME/.bashrc

pip3 install pynvim --user
npm i -g pyright

sudo apt install ripgrep
# wget https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
# dpkg -i ripgrep_13.0.0_amd64.deb
# rm ripgrep_13.0.0_amd64.deb
