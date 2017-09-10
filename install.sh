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
sudo chmod 777 "/private/etc/shells"
sudo echo "/usr/local/bin/zsh" >> "/private/etc/shells"
sudo chmod 644 "/private/etc/shells"
chsh -s /usr/local/bin/zsh
ln -Fis "$PWD/.gitconfig" $HOME
ln -Fis "$PWD/.gemrc"     $HOME
ln -Fis "$PWD/.zshenv"    $HOME
ln -Fis "$PWD/.zshrc"     $HOME

# powerlevel9k
mkdir "$HOME/tmp"
cd "$HOME/tmp"
git clone https://github.com/bhilburn/powerlevel9k.git
git clone https://github.com/gabrielelana/awesome-terminal-fonts

# do it manually message
echo "[✋ ] To install external font, please follow instruction: https://github.com/gabrielelana/awesome-terminal-fonts/wiki/OS-X"
echo "  and comment out: POWERLEVEL9K_MODE='awesome-patched' line in 90_prompt.zsh."
echo "[✋ ] To install atom packages, run 'apm install --packages-file ~/dotfiles/atom/packages.txt'."
echo "[✋ ] For preferable settings for Finder/Shortcuts, please follow here(Japanese): https://github.com/hamadu/dotfiles/wiki/macos"
