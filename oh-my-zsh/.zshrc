export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="lzygmanski"
DISABLE_UPDATE_PROMPT="true"

plugins=(
    git
    vi-mode
    docker
    docker-compose
    aws
)

source $ZSH/oh-my-zsh.sh

alias vim="nvim"
alias vi="command vim"

export EDITOR='nvim'
export AWS_PAGER=""

case "$OSTYPE" in
  darwin*)
    export PATH="/usr/local/opt/ruby/bin:$PATH"
  ;;
  linux*)
    export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"
  ;;
esac

neofetch
