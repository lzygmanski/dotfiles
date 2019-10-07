#!/bin/sh

sudo pacman -Syu --noconfirm \
	gvim \
	zsh \
 	git \
	ruby \
	autocutsel \
	compton \
	feh

PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"

gem install bundler jekyll

bundle config path "$(ruby -e 'puts Gem.user_dir')"

