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

# vim
echo "[💫 ] setting vim"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -Fis "$PWD/.vimrc" $HOME

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
echo "[💪 ] DO IT MANUALLY BELOW [👇 ] "
echo "[✋ ] To configure iTerm2"
echo " - 1. Load Preference: Preferences -> General -> Preferences -> Check 'Load preferences from...' and select '~/dotfiles/macos/iterm2'."
echo " - 2. Set font: Preferences -> Profiles -> Text -> Font -> Change Font to 'Hack Nerd Font'"
echo "[✋ ] To configure Visual Studio Code, install 'Settings Sync' and follow the instruction."
echo " - 1. Create Github Personal Access Token named 'vscode sync' (We can delete if already have): https://github.com/settings/tokens"
echo " - 2. Sync with this gist id: 3266f9e251ffb3a2173a79fd75c7a82b"
echo "[✋ ] To configure vim, launch vim and hit \":PlugInstall\"."
echo "[✋ ] For preferable settings for Finder/Shortcuts, please follow here(Japanese): https://github.com/hamadu/dotfiles/wiki/macos"
echo "[✋ ] Install preferable Ruby/Python versions using rbenv and pyenv."
echo "[✋ ] Copy or create ssh to ~/.ssh and"
echo " - $ chmod 600 /path/to/id_rsa"
echo " - $ ssh-add /path/to/id_rsa"
