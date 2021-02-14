#!/bin/sh

MY_DIR="$( cd "$(dirname "$0")" ; pwd -P )"

## Link
cd $MY_DIR/../..
stow --no-folding -v -R -t $HOME \
	git \
	neovim \
	tmux \
    oh-my-zsh \
	bin
