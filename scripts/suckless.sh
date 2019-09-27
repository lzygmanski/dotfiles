#!/bin/sh

echo "Creating .suckless directory"
mkdir -p $HOME/.suckless && cd $HOME/.suckless

echo "DWM setup"
git clone https://github.com/lzygmanski/dwm.git
cd dwm
make clean install
