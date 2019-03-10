########################################
# import basic settings
for f in $HOME/dotfiles/zsh/*; do source $f; done

########################################
# development environments

## miscellaneous scripts
export PATH=$HOME/dotfiles/scripts:$PATH

## git(diff-highlight)
export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight

## nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

## rbenv
export RBENV_ROOT=/usr/local/var/rbenv
eval "$(rbenv init -)"

## android
export PATH=/Users/hamadu/Library/Android/sdk/platform-tools:$PATH

## pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# GO
export GOPATH=$HOME/go
export PATH=$PATH:$HOME/go/bin

# rime
export CXX=g++-7

# direnv
eval "$(direnv hook zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/hamadu/.sdkman"
[[ -s "/Users/hamadu/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/hamadu/.sdkman/bin/sdkman-init.sh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/hamadu/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/hamadu/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/hamadu/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/hamadu/google-cloud-sdk/completion.zsh.inc'; fi
