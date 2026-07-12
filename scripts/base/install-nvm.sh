#!/bin/sh

set -eu

NVM_VERSION="v0.40.3"
NVM_DIR="${NVM_DIR:-$HOME/.nvm}"

if [ -s "$NVM_DIR/nvm.sh" ]; then
	echo "NVM is already installed in $NVM_DIR"
else
	mkdir -p "$NVM_DIR"
	curl -fsSL "https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_VERSION}/install.sh" \
		| PROFILE=/dev/null NVM_DIR="$NVM_DIR" bash
fi

NVM_DIR="$NVM_DIR" bash -c '
	set -e
	. "$NVM_DIR/nvm.sh"
	nvm install --lts
	nvm alias default "lts/*"

	if command -v corepack >/dev/null 2>&1; then
		corepack enable
		corepack prepare pnpm@latest --activate
	else
		npm install --global pnpm@latest
	fi
'
