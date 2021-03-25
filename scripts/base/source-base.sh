#!/bin/sh

cd $HOME

## VIM Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

## Oh My Zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## Tmux Plugin Manager
cd $HOME
sudo rm -rf .tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
