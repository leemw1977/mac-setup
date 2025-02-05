#!/bin/bash

# Install Homebrew if not installed
if ! command -v brew &> /dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install apps from Brewfile
echo "Installing apps and tools..."
brew update
brew bundle --file=./Brewfile

# macOS custom preferences
echo "Setting macOS preferences..."
# defaults write com.apple.dock autohide -bool true
# killall Dock

# take screenshots as jpg (usually smaller size) and not png
defaults write com.apple.screencapture type jpg

# do not open previous previewed files (e.g. PDFs) when opening a new one defaults write com.apple.Preview ApplePersistenceIgnoreState YES

# show Library folder
chflags nohidden ~/Library

# show hidden files
defaults write com.apple.finder AppleShowAllFiles YES

# show path bar
defaults write com.apple.finder ShowPathbar -bool true

# show status bar
defaults write com.apple.finder ShowStatusBar -bool true

killall Finder;


git config --global user.name "Lee Williams"
git config --global user.email "leemw1977@outlook.com"
git config --global init.defaultBranch main
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"


cp ~/.zshrc ~/bak.zshrc
cp ./init.zshrc ~/.zshrc

echo ".zshrc was reinitialised, now update the source"
source ~/.zshrc

echo "Setup complete!"
