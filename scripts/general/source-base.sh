#!/bin/sh

cd $HOME

## PLUG 
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

## TMP
cd $HOME
sudo rm -rf .tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

