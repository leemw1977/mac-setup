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

# Install apps from cli
echo "Install nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
# echo "Install Oh My Zsh"
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

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

echo "Setting up git"
git config --global user.name "Your Name"
git config --global user.email "youremail@example.com"
git config --global init.defaultBranch main
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

echo "Initialise starship terminal prompt"
cp ./starship.toml ~/.config/starship.toml

echo "Initialise z shell"
cp ~/.zshrc ~/bak.zshrc
cp ./init.zshrc ~/.zshrc

echo ".zshrc was reinitialised, now update the source"
source ~/.zshrc


echo "Setup complete! Remember to make iTerm2 your default and set the font to the nerd font of your choice."
