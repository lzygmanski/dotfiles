#!/bin/sh

MY_DIR="$(
	cd "$(dirname "$0")"
	pwd -P
)"

REPO_DIR="$MY_DIR/../.."
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

backup_file() {
	target="$1"

	if [ -e "$target" ] && [ ! -L "$target" ]; then
		mkdir -p "$BACKUP_DIR"
		mv "$target" "$BACKUP_DIR/"
		echo "Backed up $target to $BACKUP_DIR/"
	fi
}

backup_file "$HOME/.warp/settings.toml"
backup_file "$HOME/.warp/themes/dotfiles-dracula.yaml"

cd "$REPO_DIR" || exit 1
stow --no-folding -v -R -t "$HOME" warp
