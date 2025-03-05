#! /bin/sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

export PATH=/opt/homebrew/bin:$PATH

brew update
brew upgrade

brew install vim

brew install git
brew install git-lfs
brew install jq
brew install nvm
brew install tmux
brew install zsh
brew install wget
brew install mysql
brew install redis
brew install coreutils
brew install direnv

# zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Remove outdated versions
brew cleanup
