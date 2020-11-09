#!/bin/sh

MY_DIR="$( cd "$(dirname "$0")" ; pwd -P )"

## Install apt packages
sh $MY_DIR/macos/install.sh

## Install apt packages
sh $MY_DIR/general/pip.sh

## Clone dracula theme 
sh $MY_DIR/macos/dracula-theme.sh

## Install form Source
sh $MY_DIR/general/source-base.sh

## Link dotfiles
sh $MY_DIR/general/link-base.sh

