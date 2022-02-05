#!/bin/zsh
#wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
sed -i 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=powerlevel10k\/powerlevel10k/g' $HOME/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions)/g' $HOME/.zshrc
        
curl -fLo $HOME/.bin/nvim --create-dirs  https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage; chmod a+x $HOME/.bin/nvim
git clone https://github.com/LunarVim/Neovim-from-scratch.git ~/.config/nvim
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
zsh Miniconda3-latest-Linux-x86_64.sh -b
$HOME/miniconda3/bin/conda init zsh

echo "#---------------------- dev-evn ---------------" >> $HOME/.zshrc
echo "alias vi=\"$HOME/.bin/nvim\"" >> $HOME/.zshrc
echo "set -o vi" >> $HOME/.zshrc
echo "#---------------------- dev-evn ---------------" >> $HOME/.zshrc
