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
brew cask install teamviewer-quicksupport
# Remove brew cruft
brew cleanup
# Remove cask cruft
open https://dl.google.com/drive-file-stream/googledrivefilestream.dmg
# google drive stream require password prompt
open https://zoom.us/client/latest/Zoom.pkg
# all pkg require password prompt
open https://o.cses.konicaminolta.com/file/Default.aspx?FilePath=DL/201606/10065530/BHC3100PPSMacOS109_150MU.dmg
open https://o.cses.konicaminolta.com/file/Default.aspx?FilePath=DL/201606/27031742/BHC554ePSMacOS109_540MU.dmg
open https://ftp.hp.com/pub/softlib/software12/HP_Quick_Start/osx/Applications/HP_Easy_Start.app.zip
# drivers for printers
