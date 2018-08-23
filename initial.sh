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
brew cask install skype
brew cask install slack
brew cask install the-unarchiver
brew cask install atom
brew cask install vlc
brew cask install telegram
brew cask install ccleaner
brew cask install teamviewer-quicksupport
# Remove brew cruft
brew cleanup
# Remove cask cruft
#brew cask cleanup
#Calling `brew cask cleanup` is deprecated and will be disabled on 2018-09-30! Use `brew cleanup` instead.
# Download Google Drive File Stream
open https://dl.google.com/drive-file-stream/googledrivefilestream.dmg
#google drive stream require password prompt
# Download Zoom
open https://zoom.us/client/latest/Zoom.pkg
#all pkg require password prompt
