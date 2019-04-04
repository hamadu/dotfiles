########################################
# aliases

## cd
alias ..='cd ..'

## ls
alias ls='ls -F --color=auto'
alias ll='ls -la'

## finder
alias f='open .'

## diff
if [[ -x `which colordiff` ]]; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi

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

## editors
alias vi='vim'
alias co='code'

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

## gnu utils for macos
if [[ -x `which gfind` ]]; then
  alias find='gfind'
fi
if [[ -x `which gfind` ]]; then
  alias locate='glocate'
fi
if [[ -x `which gupdatedb` ]]; then
  alias updatedb='gupdatedb'
fi
if [[ -x `which gxargs` ]]; then
  alias xargs='gxargs'
fi
