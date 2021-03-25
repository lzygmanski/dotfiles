#!/bin/sh

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew install wget
brew install stow
brew install neofetch

brew install python
brew install luajit
brew install ninja
brew install go
brew install luarocks

brew install ShellCheck
brew install shfmt

brew install vim
brew install neovim

cd $HOME
sudo rm -rf Dev/lua-language-server

git clone https://github.com/sumneko/lua-language-server ~/Dev/lua-language-server
cd Dev/lua-language-server
git submodule update --init --recursive

cd 3rd/luamake
ninja -f ninja/macos.ninja
cd ../..
./3rd/luamake/luamake rebuild
