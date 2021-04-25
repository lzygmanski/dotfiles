#!/bin/sh

npm install -g eslint
npm install -g eslint_d
npm install -g prettier
npm install -g prettier-eslint

npm install -g @angular/language-server
npm install -g bash-language-server
npm install -g vscode-css-languageserver-bin
npm install -g dockerfile-language-server-nodejs
npm install -g graphql-language-service-cli
npm install -g vscode-html-languageserver-bin
npm install -g typescript typescript-language-server
npm install -g vscode-json-languageserver
npm install -g pyright
npm install -g vim-language-server
npm install -g yaml-language-server
npm install -g vls
npm install -g emmet-ls

go get github.com/mattn/efm-langserver@HEAD

luarocks --local install --server=https://luarocks.org/dev luaformatter
