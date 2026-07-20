typeset -U path PATH

path_prepend_if_exists() {
  [[ -d "$1" ]] && path=("$1" $path)
}

path_prepend_if_exists "$HOME/bin"
path_prepend_if_exists "$HOME/.local/bin"
path_prepend_if_exists "$HOME/.atuin/bin"
# Ensure Homebrew itself can be discovered on both Apple Silicon and Intel macOS.
path_prepend_if_exists "/opt/homebrew/bin"
path_prepend_if_exists "/usr/local/bin"
path_prepend_if_exists "$HOME/go/bin"
path_prepend_if_exists "$HOME/.luarocks/bin"

case "$OSTYPE" in
  darwin*)
    if command -v brew >/dev/null 2>&1; then
      # Faster than invoking `brew --prefix` on every shell startup.
      BREW_BIN="$(command -v brew)"
      BREW_PREFIX="${BREW_BIN:h:h}"
      path_prepend_if_exists "$BREW_PREFIX/bin"
      path_prepend_if_exists "$BREW_PREFIX/sbin"

      path_prepend_if_exists "$BREW_PREFIX/opt/ruby/bin"

      if [ -d "$BREW_PREFIX/opt/gradle/libexec" ]; then
        export GRADLE_HOME="$BREW_PREFIX/opt/gradle/libexec"
      fi

      if [ -d "$BREW_PREFIX/opt/openjdk/libexec/openjdk.jdk/Contents/Home" ]; then
        export JAVA_HOME="$BREW_PREFIX/opt/openjdk/libexec/openjdk.jdk/Contents/Home"
        path_prepend_if_exists "$JAVA_HOME/bin"
      else
        export JAVA_HOME="$(/usr/libexec/java_home 2>/dev/null)"
      fi
    else
      export JAVA_HOME="$(/usr/libexec/java_home 2>/dev/null)"
    fi

    export PNPM_HOME="$HOME/Library/pnpm"
    path_prepend_if_exists "$PNPM_HOME"
  ;;
  linux*)
    if command -v ruby >/dev/null 2>&1; then
      path_prepend_if_exists "$(ruby -e 'puts Gem.user_dir')/bin"
    fi
  ;;
esac

unfunction path_prepend_if_exists

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
  if fzf_zsh_init="$(fzf --zsh 2>/dev/null)"; then
    source =(print -r -- "$fzf_zsh_init")
  else
    [ -r /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
    [ -r /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh
  fi
fi

if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

# Load machine-specific overrides (not tracked in repo)
LOCAL_ZSHRC="${ZDOTDIR:-$HOME}/.zshrc.local"
[ -r "$LOCAL_ZSHRC" ] && source "$LOCAL_ZSHRC"
