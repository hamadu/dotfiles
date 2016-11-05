########################################
# auto completion
autoload -Uz compinit && compinit

DIRSTACKSIZE=50
zstyle ':completion:*' menu select
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:descriptions' format '%BCompleting%b %U%d%u'
