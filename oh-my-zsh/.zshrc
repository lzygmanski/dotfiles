export PATH=/usr/local/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/go/bin:$PATH
export PATH=$HOME/.luarocks/bin:$PATH

case "$OSTYPE" in
  darwin*)
    export PATH="/usr/local/opt/ruby/bin:$PATH"
  ;;
  linux*)
    export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"
  ;;
esac

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

neofetch

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
