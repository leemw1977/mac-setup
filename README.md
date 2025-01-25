# mac-setup
My mac install and set-up

Thrown together notes so I can build out properly in near future.

Brew list
Remember to brew Update
brew install \
  google-chrome \
  visual-studio-code \
  docker \
  slack \
  imageoptim \
  sequel-ace \
  font-hack-nerd-font \
  wget \
  git \
  nvm \
  yarn \
  commitizen \
  starship


Once all installed 
brew bundle install --file /path/to/Brewfile

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
omz update
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
source ~/.zshrc
brew tap homebrew/cask-fonts



#!/bin/bash
# Allow arguments for the git user name, email or ask if they are not provided

ask()
{
  declare -g $1="$2"
  if [ -z "${!1}" ]; then
    echo "$3"
    read $1
  fi
}

ask PROJECT_DIR "$1" "Directory where project resides:"
ask SITE_NAME   "$2" "Name of the website:"



echo "$PROJECT_DIR $SITE_NAME"

git config --global user.name "Your Name"
git config --global user.email "you@your-domain.com"
git config --global init.defaultBranch main
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

git config --list
# or alias
# gitconfig
