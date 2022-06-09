########################################
# Download and install oh-myz-zsh 
########################################
wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O $DEV_ENV_PACKAGE/oh-myz-zsh.sh
export RUNZSH=no
bash $DEV_ENV_PACKAGE/oh-myz-zsh.sh 

########################################
# oh-my-zsh plugins
########################################
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

sed -i 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=powerlevel10k\/powerlevel10k/g' $HOME/.zshrc
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g' $HOME/.zshrc
        
rm $DEV_ENV_PACKAGE/oh-myz-zsh.sh
