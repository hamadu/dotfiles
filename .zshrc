########################################
# import basic settings
for f in $HOME/dotfiles/zsh/*; do source $f; done

########################################
# development environments

## git(diff-highlight)
export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight

## nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

## rbenv
export RBENV_ROOT=/usr/local/var/rbenv
eval "$(rbenv init -)"

## pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# GO
export GOPATH=$HOME/go
export PATH=$PATH:$HOME/go/bin

# direnv
eval "$(direnv hook zsh)"
