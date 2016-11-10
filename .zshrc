########################################
# import settings
for f in ./dotfiles/zsh/*; do source $f; done

########################################
# development environments

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/hama_du/Downloads/google-cloud-sdk/path.zsh.inc ]; then
  source '/Users/hama_du/Downloads/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/hama_du/Downloads/google-cloud-sdk/completion.zsh.inc ]; then
  source '/Users/hama_du/Downloads/google-cloud-sdk/completion.zsh.inc'
fi
