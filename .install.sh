cd ~

# Download all dotfiles by hard link
#ls -a vim-tmux | xargs rm -rf
src=vim-tmux
dst=~
absolute_dst=$(umask 077 && mkdir -p -- "$dst" && cd -P -- "$dst" && pwd -P) &&
(cd -P -- "$src" && find . | cpio -pl "$absolute_dst")
rm -rf ~/.git ~/.gitignore ~/.install.sh ~/README.md 

# Homebrew
if [ "$(uname)" == "Darwin" ]; then
    #install homebrew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update
    brew install vim && brew install macvim
    ln -s /usr/local/bin/mvim vim
    brew install zsh
    brew install tmux
    brew install ctags
    brew install ack
else
    sudo apt-get install zsh
    sudo apt-get install tmux
fi

# Python
unlink /usr/local/bin/python
ln -s /usr/local/bin/python3 /usr/local/bin/python
unlink /usr/local/bin/pip
ln -s /usr/local/bin/pip3 /usr/local/bin/pip

# ZSH
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
chsh -s $(which zsh)
source ~/.zshrc
npm install --global pure-prompt

# VIM
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe && ./install.py
cd -
