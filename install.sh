#!/bin/sh

# defaults
sh "$PWD/macos/defaults.sh"

# homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap Homebrew/bundle
brew bundle --file="$PWD/macos/homebrew/Brewfile"

# chsh
chsh -s /usr/local/bin/zsh
ln -Fis "$PWD/.zshenv" $HOME
ln -Fis "$PWD/.zshrc" $HOME
