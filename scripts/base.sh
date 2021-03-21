#!/bin/sh

MY_DIR="$(
	cd "$(dirname "$0")"
	pwd -P
)"

sh "$MY_DIR/base/source-base.sh"
sh "$MY_DIR/base/pip.sh"
sh "$MY_DIR/base/link-base.sh"
