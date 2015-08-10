#! /bin/sh
brew update
brew upgrade

brew tap homebrew/versions
brew tap phinze/homebrew-cask
brew tap homebrew/binary

brew install subversion

brew install vim

brew install ag
brew install git
brew install go
brew install jq
brew install nvm
brew install npm
brew install rbenv
brew install tig
brew install tmux
brew install zsh

brew install caskroom/cask/brew-cask
brew cask install virtualbox
brew cask install vagrant

# Remove outdated versions
brew cleanup
