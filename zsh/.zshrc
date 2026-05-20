export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.luarocks/bin:$PATH"

case "$OSTYPE" in
  darwin*)
    if command -v brew >/dev/null 2>&1; then
      BREW_PREFIX="$(brew --prefix)"
      export PATH="$BREW_PREFIX/opt/python@3.12/libexec/bin:$PATH"
      export PATH="$BREW_PREFIX/opt/ruby/bin:$PATH"
      export GRADLE_HOME="$BREW_PREFIX/opt/gradle/libexec"

      if [ -d "$BREW_PREFIX/opt/openjdk/libexec/openjdk.jdk/Contents/Home" ]; then
        export JAVA_HOME="$BREW_PREFIX/opt/openjdk/libexec/openjdk.jdk/Contents/Home"
        export PATH="$JAVA_HOME/bin:$PATH"
      else
        export JAVA_HOME="$(/usr/libexec/java_home 2>/dev/null)"
      fi
    else
      export JAVA_HOME="$(/usr/libexec/java_home 2>/dev/null)"
    fi

    export PNPM_HOME="$HOME/Library/pnpm"
    case ":$PATH:" in
      *":$PNPM_HOME:"*) ;;
      *) export PATH="$PNPM_HOME:$PATH" ;;
    esac
  ;;
  linux*)
    if command -v ruby >/dev/null 2>&1; then
      export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"
    fi
  ;;
esac

export EDITOR="nvim"
export VISUAL="$EDITOR"
export AWS_PAGER=""

alias vim="nvim"
alias vi="command vim"

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

autoload -Uz compinit
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
if [[ -r "$ZINIT_HOME/zinit.zsh" ]]; then
  source "$ZINIT_HOME/zinit.zsh"

  zinit ice lucid blockf atpull'zinit creinstall -q .'
  zinit light zsh-users/zsh-completions
fi

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
compinit

if (( ${+functions[zinit]} )); then
  zinit ice wait lucid
  zinit light zsh-users/zsh-autosuggestions

  zinit ice wait lucid
  zinit light zdharma-continuum/fast-syntax-highlighting
fi

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

if command -v atuin >/dev/null 2>&1; then
  eval "$(atuin init zsh)"
fi

if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi

if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
