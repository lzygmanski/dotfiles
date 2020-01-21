#!/bin/sh

MY_DIR="$( cd "$(dirname "$0")" ; pwd -P )"

## Install apt packages
sh $MY_DIR/ubuntu/install.sh

## Install python packages
sh $MY_DIR/general/pip.sh

## Install form Source
sh $MY_DIR/general/source.sh

## Link dotfiles
sh $MY_DIR/general/link.sh
