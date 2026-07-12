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

if [ "$(readlink "$HOME/.zshrc")" = "$REPO_DIR/oh-my-zsh/.zshrc" ]; then
	rm "$HOME/.zshrc"
fi

if [ "$(readlink "$HOME/.oh-my-zsh")" = "$REPO_DIR/oh-my-zsh/.oh-my-zsh" ]; then
	rm "$HOME/.oh-my-zsh"
fi

backup_file "$HOME/.gitconfig"
backup_file "$HOME/.tmux.conf"
backup_file "$HOME/.zshrc"
backup_file "$HOME/.warp/settings.toml"
backup_file "$HOME/.warp/themes/dotfiles-dracula.yaml"

cd "$REPO_DIR" || exit 1
stow --no-folding -v -R -t "$HOME" \
	git \
	vim \
	tmux \
	zsh \
	warp
