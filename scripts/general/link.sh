#!/bin/sh

MY_DIR="$( cd "$(dirname "$0")" ; pwd -P )"

## Link
cd $MY_DIR/../..
stow -v -R -t $HOME \
	git \
	bspwm \
	compton \
	neovim \
	polybar \
	sxhkd \
	tmux \
	vim \
	xorg \
	wallpapers \
	bin
