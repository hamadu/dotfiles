#!/bin/sh

echo "=================================================="
echo " =====                                      ====="
echo " = 💻  Set-up ubuntu development environment  💻  ="
echo " =====                                      ====="
echo "=================================================="

# defaults

# apt
sudo apt install -y $(cat ubunt/apt-installed.txt)

# zsh
echo "[💫 ] setting zsh"
chsh -s /usr/bin/zsh
ln -Fis "$PWD/.gitconfig" $HOME
ln -Fis "$PWD/.gemrc"     $HOME
ln -Fis "$PWD/.zshenv"    $HOME
ln -Fis "$PWD/.zshrc"     $HOME

# tmux
echo "[💫 ] setting tmux"
ln -Fis "$PWD/tmux/.tmux.conf" $HOME

# rustup
echo "[💫 ] setting rustup"
curl https://sh.rustup.rs -sSf | sh

# powerlevel9k
echo "[💫 ] setting powerlevel9k"
mkdir "$HOME/tmp"
cd "$HOME/tmp"
git clone https://github.com/bhilburn/powerlevel9k.git
git clone https://github.com/gabrielelana/awesome-terminal-fonts

# do it manually message
echo "[✋ ] To configure Visual Studio Code, install 'Settings Sync' and follow the instruction."
echo " - 1. Create Github Personal Access Token named 'vscode sync' (We can delete if already have): https://github.com/settings/tokens"
echo " - 2. Sync with this gist id: 3266f9e251ffb3a2173a79fd75c7a82b"
echo "[✋ ] Install preferable Ruby/Python versions using rbenv and pyenv."

