
# remove nvim
rm -rf $HOME/.bin/nvim
# remove following line in .bashrc
# echo "alias vi="nvim.appimage"" >> $HOME/.bashrc

# remove init.vim
rm -rf $HOME/.config/nvim

# remove plug
rm -rf $HOME/.local/share/nvim/site/autoload/plug.vim

# remove nodejs
rm -rf $HOME/.bin/node-v14.17.1-linux-x64

# uninstall pynvim
pip3 uninstall pynvim

# uninstall pyright
npm r -g pyright

