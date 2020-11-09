#!/bin/sh

## TMP
mkdir -p ~/.theme/dracula
cd ~/.theme/dracula

sudo rm -rf iterm 
git clone https://github.com/dracula/iterm.git

sudo rm -rf terminal-app
git clone https://github.com/dracula/terminal-app.git

