#!/bin/bash

mkdir -p ~/.config/nvim
cp init.vim $HOME/.config/nvim/

mkdir -p $HOME/.bin
cp nvim.appimage $HOME/.bin

echo "export PATH=$HOME/.bin:$PATH" > $HOME/.bashrc

pip3 install pynvim --user

npm i pyright

