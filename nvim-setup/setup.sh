#!/bin/bash

DOCKER_HOME=../docker-home

curl -fLo $DOCKER_HOME/.bin/nvim.appimage --create-dirs https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod a+x $DOCKER_HOME/.bin/nvim.appimage

curl -fLo $DOCKER_HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p $DOCKER_HOME/.config/nvim
cp $PWD/init.vim $DOCKER_HOME/.config/nvim/init.vim

cp $PWD/.bashrc $DOCKER_HOME/.bashrc
