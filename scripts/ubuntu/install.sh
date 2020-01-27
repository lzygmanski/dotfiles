#!/bin/sh

## Add repositiries
sudo add-apt-repository ppa:linuxuprising/shutter

## Install libraries
sudo apt-get install -y \
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
	libnl-genl-3-dev \
	libx11-dev \
	libxinerama-dev \
	libxft-dev

## Install dev tools
sudo apt install -y \
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

## install standard tools
sudo apt-get install -y \
	dmenu \
	rxvt-unicode-256color \
	xbindkeys \
	arandr \
	pavucontrol \
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
	nautilus \
	scrot \
	shutter

## SNAP install
sudo snap install --classic code
sudo snap install --classic slack

## Nodejs
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

## Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install -y yarn