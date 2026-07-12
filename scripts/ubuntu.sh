#!/bin/sh

set -eu

MY_DIR="$(
	cd "$(dirname "$0")"
	pwd -P
)"

if [ ! -r /etc/os-release ] || ! grep -q '^ID=ubuntu$' /etc/os-release; then
	echo "This installer supports Ubuntu only." >&2
	exit 1
fi

sh "$MY_DIR/ubuntu/install.sh"
sh "$MY_DIR/base/install-nvm.sh"
sh "$MY_DIR/base.sh"

echo
echo "Ubuntu setup complete. To make Zsh your login shell, run:"
echo "  chsh -s $(command -v zsh)"
echo "Then log out and reconnect over SSH."
