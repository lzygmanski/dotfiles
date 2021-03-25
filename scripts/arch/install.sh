#!/bin/sh

sudo pacman -Syy

sudo pacman -S --noconfirm cmake
sudo pacman -S --noconfirm wget stow neofetch
sudo pacman -S --noconfirm python luajit ninja go luarocks
sudo pacman -S --noconfirm shellcheck shfmt
#sudo pacman -S --noconfirm vim neovim python-pynvim

cd $HOME
sudo rm -rf Dev/lua-language-server

git clone https://github.com/sumneko/lua-language-server ~/Dev/lua-language-server
cd Dev/lua-language-server
git submodule update --init --recursive

cd 3rd/luamake
ninja -f ninja/linux.ninja
cd ../..
./3rd/luamake/luamake rebuild
