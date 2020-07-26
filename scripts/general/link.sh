#!/bin/sh

MY_DIR="$( cd "$(dirname "$0")" ; pwd -P )"

## Link
sh $MY_DIR/link-base.sh
sh $MY_DIR/link-desktop.sh

