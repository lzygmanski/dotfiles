#!/bin/sh

set -eu

if [ "$(id -u)" -eq 0 ]; then
	SUDO=""
elif command -v sudo >/dev/null 2>&1; then
	SUDO="sudo"
else
	echo "Run this script as root or install sudo." >&2
	exit 1
fi

$SUDO apt-get update
$SUDO env DEBIAN_FRONTEND=noninteractive apt-get install -y \
	ca-certificates \
	curl \
	fzf \
	git \
	git-lfs \
	neovim \
	stow \
	tmux \
	unzip \
	vim \
	wget \
	zsh

mkdir -p "$HOME/.local/bin"

if ! command -v starship >/dev/null 2>&1; then
	curl -fsSL https://starship.rs/install.sh | sh -s -- -y -b "$HOME/.local/bin"
fi

if ! command -v zoxide >/dev/null 2>&1; then
	curl -fsSL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
fi

if ! command -v atuin >/dev/null 2>&1; then
	curl -fsSL https://setup.atuin.sh | sh
fi

if ! command -v lazygit >/dev/null 2>&1; then
	case "$(uname -m)" in
		x86_64) lazygit_arch="x86_64" ;;
		aarch64 | arm64) lazygit_arch="arm64" ;;
		*) lazygit_arch="" ;;
	esac

	if [ -n "$lazygit_arch" ]; then
		lazygit_version="$(curl -fsSL https://api.github.com/repos/jesseduffield/lazygit/releases/latest | sed -n 's/.*"tag_name": *"v\([^"]*\)".*/\1/p' | head -n 1)"
		tmp_dir="$(mktemp -d)"
		trap 'rm -rf "$tmp_dir"' EXIT HUP INT TERM
		curl -fsSL "https://github.com/jesseduffield/lazygit/releases/download/v${lazygit_version}/lazygit_${lazygit_version}_Linux_${lazygit_arch}.tar.gz" \
			| tar -xz -C "$tmp_dir" lazygit
		install -m 0755 "$tmp_dir/lazygit" "$HOME/.local/bin/lazygit"
		rm -rf "$tmp_dir"
		trap - EXIT HUP INT TERM
	else
		echo "Skipping lazygit: unsupported architecture $(uname -m)." >&2
	fi
fi

ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname "$ZINIT_HOME")"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

TPM_HOME="$HOME/.tmux/plugins/tpm"
if [ ! -d "$TPM_HOME" ]; then
	mkdir -p "$(dirname "$TPM_HOME")"
	git clone https://github.com/tmux-plugins/tpm "$TPM_HOME"
fi
