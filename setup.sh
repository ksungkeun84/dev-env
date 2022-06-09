#!/bin/zsh


push $PWD
cd $DEV_SCRTIPS
bash zsh.sh
bash oh-my-zsh.sh
bash nvim.sh
bash spack.sh
popd

