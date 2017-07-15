cd Environment
mv .ctags .tmux.conf .vimrc .zsh_aliases .zsh_functions .zshrc ~
rm -rf ~/.vim
mv .vim/ ~
cd ..
rm -rf Environment

if [ "$(uname)" == "Darwin" ]; then
    brew install zsh
    brew install vim --with-lua
else
    apt-get install zsh
fi

chsh -s $(which zsh)

git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
