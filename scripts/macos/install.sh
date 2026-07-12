#!/bin/sh

if ! command -v brew >/dev/null 2>&1; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install --cask warp

brew install git
brew install wget
brew install stow

brew install tmux
brew install vim
brew install neovim
brew install starship
brew install zoxide
brew install atuin
brew install fzf
brew install lazygit
brew install openjdk
brew install gradle

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
