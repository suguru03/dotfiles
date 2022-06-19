#! /bin/sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

brew tap homebrew/versions || true
brew tap homebrew/binary || true

brew install subversion

brew install vim

brew install ag
brew install git
brew install jq
brew install nvm
brew install rbenv
brew install tmux
brew install zsh
brew install wget
brew install mysql
brew install redis
brew install coreutils

# zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Remove outdated versions
brew cleanup
