#!/bin/sh

## Add repositiries
sudo add-apt-repository ppa:linuxuprising/shutter

## Install libraries
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

## Install dev tools
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

## install standard tools
sudo apt-get install \
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

## install from .deb
### Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

## Other
### Brave install
sudo apt install apt-transport-https curl
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser