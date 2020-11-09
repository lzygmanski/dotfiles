#!/bin/sh

MY_DIR="$( cd "$(dirname "$0")" ; pwd -P )"

## Install form Source
sh $MY_DIR/general/source-base.sh

## Link dotfiles
sh $MY_DIR/general/link-base.sh
