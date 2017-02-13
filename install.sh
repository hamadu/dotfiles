#!/bin/sh

echo "=================================================="
echo " =====                                      ====="
echo " = 💻   Set-up macos development environment  💻  ="
echo " =====                                      ====="
echo "=================================================="

# defaults
echo "[💫 ] changing macos default setting"
sh "$PWD/macos/defaults.sh"

# homebrew
echo "[💫 ] installing brew packages"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap Homebrew/bundle
brew bundle --file="$PWD/macos/homebrew/Brewfile"

# zsh
echo "[💫 ] setting zsh"
chsh -s /usr/local/bin/zsh
ln -Fis "$PWD/.zshenv"    $HOME
ln -Fis "$PWD/.zshrc"     $HOME
ln -Fis "$PWD/.gitconfig" $HOME
ln -Fis "$PWD/.gemrc"     $HOME
