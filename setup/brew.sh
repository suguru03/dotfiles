#! /bin/sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

brew tap homebrew/versions || true
brew tap phinze/homebrew-cask || true
brew tap homebrew/binary || true

brew install subversion

brew install vim

brew install ag
brew install git
brew install go
brew install go-app-engine-64
brew install android-sdk
brew install glide
brew install jq
brew install nvm
brew install npm
brew install rbenv
brew install tig
brew install tmux
brew install zsh
brew install wget
brew install mysql
brew install redis
brew install coreutils
brew install python
brew linkapps python
brew install cmake

# docker
brew install docker-machine-driver-xhyve

# react native
brew install watchman

brew install caskroom/cask/brew-cask
brew cask install virtualbox
brew cask install vagrant

brew install neovim/neovim/neovim

# zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Remove outdated versions
brew cleanup
