########################################
# prompt
# autoload -Uz vcs_info
# setopt prompt_subst
# zstyle ':vcs_info:*' formats '[%F{green}%b%f]'
# zstyle ':vcs_info:*' actionformats '[%F{green}%b%f(%F{red}%a%f)]'
# precmd() { vcs_info }
# PROMPT='%{${fg[yellow]}%}%~%{${reset_color}%}
# [%n@%md]${vcs_info_msg_0_}
# %(?.%B%F{green}.%B%F{blue})%(?!(๑˃̵ᴗ˂̵)ﻭ < !(;^ω^%) < )%f%b'
# RPROMPT=''

# powerline
# export PATH="$HOME/.local/bin/:$PATH"
# powerline-daemon -q
# . /Users/hama_du/.local/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh

# to patch font, see instruction here: https://github.com/gabrielelana/awesome-terminal-fonts/wiki/OS-X
# POWERLEVEL9K_MODE='awesome-patched'

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status ip battery time)

POWERLEVEL9K_DIR_HOME_BACKGROUND='09'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='09'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='009'
POWERLEVEL9K_DIR_HOME_FOREGROUND='236'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='236'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='236'

POWERLEVEL9K_VCS_CLEAN_BACKGROUND='236'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='119'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='236'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='214'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='236'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='196'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='236'

source "$HOME/tmp/powerlevel9k/powerlevel9k.zsh-theme"
