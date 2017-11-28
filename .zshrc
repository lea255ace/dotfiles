#set up xterm to have 256 colors
export TERM=xterm-256color

[[ -r "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]] && . "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

setopt CSH_NULL_GLOB
setopt NO_HIST_VERIFY

# Customize git aliases
alias gl='git grog'
alias gla='git grog --all'
alias gst='git st'

# vi mode settings
export KEYTIMEOUT=20
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^R' history-incremental-search-backward
bindkey '^F' history-incremental-search-forward
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
