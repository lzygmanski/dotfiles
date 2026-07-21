typeset -U path PATH

ZDOTDIR_REAL="${ZDOTDIR:-$HOME}"
ZSHRC_DIR="${${(%):-%N}:A:h}"

[ -r "$ZDOTDIR_REAL/.zshrc.local.pre" ] && source "$ZDOTDIR_REAL/.zshrc.local.pre"

for file in "$ZSHRC_DIR"/zshrc.d/*.zsh(N); do
  source "$file"
done

[ -r "$ZDOTDIR_REAL/.zshrc.local" ] && source "$ZDOTDIR_REAL/.zshrc.local"
[ -r "$ZDOTDIR_REAL/.zshrc.local.post" ] && source "$ZDOTDIR_REAL/.zshrc.local.post"
