# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
