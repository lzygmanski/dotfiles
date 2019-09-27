#!/bin/sh

suckless=$HOME/.suckless

echo "Creating $suckless directory"
mkdir -p $suckless && cd $suckless

echo "DWM setup"
git clone https://github.com/lzygmanski/dwm.git
cd dwm
sudo make clean install
