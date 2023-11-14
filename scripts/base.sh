#!/bin/sh

MY_DIR="$(
	cd "$(dirname "$0")"
	pwd -P
)"

sh "$MY_DIR/base/link-base.sh"
