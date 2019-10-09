#!/bin/sh

sudo pacman -Syu --noconfirm \
	gvim \
	zsh \
 	git \
	ruby \
	autocutsel \
	compton \
	feh


curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"

gem install bundler jekyll

bundle config path "$(ruby -e 'puts Gem.user_dir')"

