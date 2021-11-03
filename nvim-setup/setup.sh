#!/bin/bash

while getopts h:m: option
do
    case "${option}"
    in
        h) NVIM_HOME=${OPTARG};;
        m) MODE=${OPTARG};;
    esac
done

if [ -z $NVIM_HOME ]; then
    echo "Enter home directory"
    exit
fi

if [ -z $MODE ]; then
    echo "Enter mode (docker/native)"
    exit
fi

if [ "$MODE" != "docker" or "$MODE" != "native" ]; then
    echo "Enter mode (docker/native)"
    exit
fi

curl -fLo $NVIM_HOME/.bin/nvim.appimage --create-dirs  https://github.com/neovim/neovim/releases/download/v0.5.1/nvim.appimage
chmod a+x $NVIM_HOME/.bin/nvim.appimage

curl -fLo $NVIM_HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p $NVIM_HOME/.config/nvim
cp $PWD/init.vim $NVIM_HOME/.config/nvim/init.vim

if [ "$MODE" == "docker" ]; then
    cp $PWD/.bashrc $NVIM_HOME/.bashrc
else
    BASH_FILE=$NVIM_HOME/.bashrc
    STRING1="export PATH=/root/miniconda3/bin:\$HOME/.bin/:\$PATH"
    STRING2="alias vi='nvim.appimage'"
    STRING3="set -o vi"
    echo "$STRING1" >> $BASH_FILE
    echo "$STRING2" >> $BASH_FILE
    echo "$STRING3" >> $BASH_FILE
fi



if [ "$MODE" == "native" ]; then
    echo "TODO: install necessary packets for native setup"
fi
