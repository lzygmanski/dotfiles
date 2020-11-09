#!/bin/sh

MY_DIR="$( cd "$(dirname "$0")" ; pwd -P )"

## Install apt packages
sh $MY_DIR/ubuntu/install.sh

## Additional packages
sh $MY_DIR/ubuntu/additional.sh

## Install python packages
sh $MY_DIR/general/pip.sh

## Install form Source
sh $MY_DIR/general/source-base.sh
sh $MY_DIR/bspwm/source-desktop.sh

## Link dotfiles
sh $MY_DIR/general/link-base.sh
sh $MY_DIR/bspwm/link-desktop.sh
