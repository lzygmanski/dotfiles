#!/bin/sh

## BSPWM
cd $HOME
sudo rm -rf bspwm
git clone https://github.com/baskerville/bspwm.git
cd bspwm && make && sudo make install

## SXHKD
cd $HOME
sudo rm -rf sxhkd
git clone https://github.com/baskerville/sxhkd.git
cd sxhkd && make && sudo make install

## Polybar
cd $HOME
sudo rm -rf polybar
git clone --recursive https://github.com/polybar/polybar
cd polybar && sudo ./build.sh

## dmenu
cd $HOME
sudo rm -rf dmenu
git clone https://github.com/lzygmanski/dmenu
git remote add suckless https://git.suckless.org/dmenu
cd dmenu && make && sudo make install

