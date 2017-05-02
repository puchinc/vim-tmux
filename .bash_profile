export PS1="\u:\w \$"
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
#export NODE_PATH="/Users/puchin/.node/lib/node_modules"
export NODE_PATH=/usr/lib/node_modules:$NODE_PATH

if [ -f ~/.git-completion.bash ]; then
. ~/.git-completion.bash
fi

if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi

[[ -s /Users/puchin/.nvm/nvm.sh ]] && . /Users/puchin/.nvm/nvm.sh # This loads NVM

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# added by Anaconda3 4.3.1 installer
export PATH="/Users/puchin/anaconda/bin:$PATH"
