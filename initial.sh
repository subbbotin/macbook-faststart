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
brew cask install teamviewer-quicksupport
brew cleanup
# download packages is better than cask
open https://dl.google.com/drive-file-stream/googledrivefilestream.dmg
open https://zoom.us/client/latest/Zoom.pkg
# drivers for printers
open https://o.cses.konicaminolta.com/file/Default.aspx?FilePath=DL/201606/10065530/BHC3100PPSMacOS109_150MU.dmg
open https://o.cses.konicaminolta.com/file/Default.aspx?FilePath=DL/201606/27031742/BHC554ePSMacOS109_540MU.dmg
open https://ftp.hp.com/pub/softlib/software12/HP_Quick_Start/osx/Applications/HP_Easy_Start.app.zip
# MS Office
open https://drive.google.com/open?id=1nsNBvFpnBiezkEf28Ke3nHI0-ntjDWqO
