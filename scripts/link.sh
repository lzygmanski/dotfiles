#!/bin/sh

MY_DIR="$( cd "$(dirname "$0")" ; pwd -P )"

## Link
cd $MY_DIR/..
stow -v -R -t $HOME \
	bspwm \
	compton \
	neovim \
	sxhkd \
	tmux \
	vim \
	xorg \
	feh