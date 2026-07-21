export EDITOR="nvim"
export VISUAL="$EDITOR"
export AWS_PAGER=""

alias vim="nvim"
alias vi="command vim"
alias python="python3"
alias pip="pip3"

setopt auto_cd
setopt auto_pushd
setopt complete_in_word
setopt extended_glob
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt inc_append_history
setopt interactive_comments
setopt share_history

HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

bindkey -v
export KEYTIMEOUT=1
