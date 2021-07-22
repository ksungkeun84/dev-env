#!/bin/bash

DOCKER_HOME=docker-home

curl -fLo $DOCKER_HOME/.bin/nvim/nvim --create-dirs https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod a+x $DOCKER_HOME/.bin/nvim/nvim

curl -fLo $DOCKER_HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p $DOCKER_HOME/.config/nvim 
cp $PWD/init.vim $DOCKER_HOME/.config/nvim/init.vim
cp $PWD/.zshrc $DOCKER_HOME/.zshrc


# anaconda
curl -fLo $DOCKER_HOME/Anaconda3-5.0.1-Linux-x86_64.sh https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh
