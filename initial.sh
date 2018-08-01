#!/bin/bash
# Check that Homebrew is installed and install it if not
if test ! $(which brew)
then
  echo "Installing Homebrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
# Update any existing homebrew recipes
brew update
# Upgrade any already installed formulae
brew upgrade --all
# Install desired cask packages
brew cask install teamviewer
brew cask install skype
brew cask install slack
brew cask install the-unarchiver
brew cask install zoomus
brew cask install atom
brew cask install vlc
brew cask install google-drive-file-stream
brew cask install telegram
brew cask install ccleaner
# Remove brew cruft
brew cleanup
# Remove cask cruft
brew cask cleanup
