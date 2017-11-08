#set up xterm to have 256 colors
export TERM=xterm-256color

[[ -r "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]] && . "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

setopt CSH_NULL_GLOB

# vi mode settings
export KEYTIMEOUT=20
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^R' history-incremental-search-backward
bindkey '^F' history-incremental-search-forward
