#!/bin/sh

echo "Install pacman packages"
sh ./packages.sh

echo "Install .suckless packages"
sh ./suckless.sh

echo "Set zsh as default shell"
usermod -s /bin/zsh $USER
