# Download all dotfiles
cd Environment
mv .ctags .tmux.conf .vimrc .zsh_aliases .zsh_functions .zshrc ~
mkdir ~/.vim 2>/dev/null
mv .vim/* ~/.vim
cd -
rm -rf Environment

# ZSH
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
chsh -s $(which zsh)
source ~/.zshrc

# VIM
if [ "$(uname)" == "Darwin" ]; then
    #install homebrew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update
    brew install vim && brew install macvim
    brew install zsh
    brew install tmux
else
    sudo apt-get install zsh
    sudo apt-get install tmux
fi
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe
./install.py
cd -
