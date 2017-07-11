# zsh vimrc setting


install zsh && oh-my-zsh
```
brew install zsh 
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

Linux
```
apt-get install zsh
chsh -s $(which zsh)
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
```

zsh-autosuggestions
```
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
# add this line into .zshrc
plugins=(zsh-autosuggestions)
# add this line into this file
bindkey '^l' autosuggest-accept
$ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
```

Powerline
```
# clone
git clone https://github.com/powerline/fonts.git
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
```

setup my environment
```
git clone https://github.com/michaelchen110/Environment.git 
mv Environment/.* . || rm -r Environment
source ~/.zshrc
```

install vundle plugins
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
brew install vim --with-lua
```
