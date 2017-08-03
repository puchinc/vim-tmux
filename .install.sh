cd Environment
mv .ctags .tmux.conf .vimrc .zsh_aliases .zsh_functions .zshrc ~
mkdir ~/.vim 2>/dev/null
mv .vim/* ~/.vim
cd ..
rm -rf Environment

if [ "$(uname)" == "Darwin" ]; then
    brew install zsh
    brew install tmux
else
    sudo apt-get install zsh
    sudo apt-get install tmux
fi

git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
chsh -s $(which zsh)
source ~/.zshrc
vim +PluginInstall +qall
