#!/bin/sh

MY_DIR="$(
	cd "$(dirname "$0")"
	pwd -P
)"

cd $MY_DIR/../..
stow --no-folding -v -R -t $HOME \
    cspell \
	git \
	vim \
	neovim \
	tmux \
	oh-my-zsh
