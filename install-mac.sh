#!/bin/bash

# Install brew package
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew_installs="sqlite zsh zsh-completions vim git wget nvm"
for brew_install in $brew_installs; do
  echo "Brew install $brew_install"
  brew install $brew_install
done

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install theme `lambda-mod`
wget "https://raw.githubusercontent.com/halfo/lambda-mod-zsh-theme/master/lambda-mod.zsh-theme" > ~/.oh-my-zsh/themes/lambda-mod.zsh-theme

# Install iTerm2
brew cask install iterm2

# Link config files
DOTDIR=~/.dotfiles
files="vimrc vim zshrc oh-my-zsh" # list of files/folders to symlink in homedir

# Move shell default to ZSH
chsh -s /usr/local/bin/zsh

# Create Symlink to each file
for file in $files; do
  echo "Creating symlink to $file in home directory"
  ln -sfv $DOTDIR/$file ~/.$file
done

echo "Remember to install Docker, MySQL, GitX, Chrome, Chrome Canary, FireFox, VSCode, Sublime Text"
