#!/bin/bash

brew update
brew upgrade

# Programming languages
brew install python
brew install node

# Dev tools
brew install fish
brew install ack
brew install git

# Brew cask
brew tap caskroom/cask

brew cask install 1password
brew cask install dropbox
brew cask install google-chrome
brew cask install macvim
brew cask install iterm2
