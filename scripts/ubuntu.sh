#!/bin/sh

MY_DIR="$( cd "$(dirname "$0")" ; pwd -P )"

## Lib
sudo apt-get install \
	libxcb-xinerama0-dev \
	libxcb-icccm4-dev \
	libxcb-randr0-dev \
	libxcb-util0-dev \
	libxcb-ewmh-dev \
	libxcb-keysyms1-dev \
	libxcb-shape0-dev \
	libcairo2-dev \
	libxcb1-dev \
	libxcb-composite0-dev \
	libxcb-image0-dev \
	libxcb-xkb-dev \
	libxcb-xrm-dev \
	libxcb-cursor-dev \
	libasound2-dev \
	libpulse-dev \
	libjsoncpp-dev \
	libmpdclient-dev \
	libcurl4-openssl-dev \
	libnl-genl-3-dev 

## Dev
sudo apt install \
	build-essential \
	git \
	cmake \
	cmake-data \
	pkg-config \
	python3 \
	python3-sphinx \
	python3-pip \
	python-xcbgen \
	imagemagick \
 	xcb-proto \
	clang-7.0 \
	universal-ctags

## Standard
sudo apt-get install \
	rxvt-unicode-256color \
	dunst \
	vim \
	vim-gtk \
	neovim \
	tmux \
	autocutsel \
	compton \
	feh \
	stow \
	ranger \
	nautilus

## Pywall
sudo pip3 install pywal

## Source
sh $MY_DIR/source.sh

## Link
sh $MY_DIR/link.sh
