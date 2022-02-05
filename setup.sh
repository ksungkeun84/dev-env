#!/bin/zsh

########################
# oh-my-zsh plugins
########################
#wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

sed -i 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=powerlevel10k\/powerlevel10k/g' $HOME/.zshrc
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g' $HOME/.zshrc
        
########################
# neovim
########################
curl -fLo $HOME/.bin/nvim.appimage --create-dirs  https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod a+x $HOME/.bin/nvim.appimage
git clone https://github.com/LunarVim/Neovim-from-scratch.git ~/.config/nvim

########################
# miniconda 
#######################
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
zsh Miniconda3-latest-Linux-x86_64.sh -b
$HOME/miniconda3/bin/conda init zsh

echo "#---------------------- dev-evn ---------------" >> $HOME/.zshrc
echo "alias vi=\"$HOME/.bin/nvim.appimage\"" >> $HOME/.zshrc
echo "set -o vi" >> $HOME/.zshrc
echo "#---------------------- dev-evn ---------------" >> $HOME/.zshrc
