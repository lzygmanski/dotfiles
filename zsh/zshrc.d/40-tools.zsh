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

# fzf's key-bindings script rebinds Tab; reassert autosuggestion-aware Tab after it loads.
bindkey -M viins '^I' autosuggest-accept-or-complete
