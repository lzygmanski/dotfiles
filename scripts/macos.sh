#!/bin/sh

MY_DIR="$(
	cd "$(dirname "$0")"
	pwd -P
)"

sh "$MY_DIR/macos/install.sh"
sh "$MY_DIR/macos/dracula-theme.sh"
sh "$MY_DIR/base.sh"
