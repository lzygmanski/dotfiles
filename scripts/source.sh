#!/bin/sh

## BSPWM
cd $HOME
rm -Rf bspwm
git clone https://github.com/baskerville/bspwm.git
cd bspwm && make && sudo make install

## SXHKD
cd $HOME
rm -rf sxhkd
git clone https://github.com/baskerville/sxhkd.git
cd sxhkd && make && sudo make install