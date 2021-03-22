#!/bin/sh

MY_DIR="$(
	cd "$(dirname "$0")"
	pwd -P
)"

sh "$MY_DIR/arch/install.sh"
sh "$MY_DIR/base.sh"
