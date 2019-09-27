#!/bin/sh

scripts="$(dirname "$0")"

echo "Install pacman packages"
sh $scripts/packages.sh

echo "Install .suckless packages"
sh $scripts/suckless.sh

echo "Link dotfiles"
sh $scripts/linkconfig.sh

echo "Set zsh as default shell"
usermod -s /bin/zsh $USER

