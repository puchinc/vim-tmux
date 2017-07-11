mv .ctags .tmux.conf .vimrc .zsh_aliases .zsh_functions .zshrc ~
rm -rf ~/.vim
mv .vim/ ~
cd ..
rm -rf Environment
apt-get install zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
