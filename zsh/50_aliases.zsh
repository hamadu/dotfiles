########################################
# aliases

## cd
alias ..='cd ..'
alias ll='ls -lAF'
alias la='ls -AF'

## finder
alias f='open .'

## grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

## git
alias gpl='git pull'
alias gpu='git push'
alias gst='git status'
alias gci='git commit'
alias gco='git checkout'
alias gcl='git clone'
alias gs='git status'
alias ga='git add'
alias gd='git diff'
alias gdd='git diff HEAD'
alias gpp='git push --set-upstream origin'
alias gbda="git branch --merged | grep -vE '^\*|master$|develop$' | xargs -I % git branch -d %"

## vim
alias vi='vim'

## nikki
alias nikki='atom ~/projects/diary/`date +%Y%m%d`.md'

## bundler
alias be='bundle exec'

## docker
alias dea='docker-compose exec app'
alias dcln=docker rm $(docker ps -a | grep "Exited" | awk '{print $1}') && docker rm $(docker images -a | grep "^<none>" | awk '{print $3}')

## github
alias g='cd $(ghq root)/$(ghq list | peco)'
alias gh='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'

