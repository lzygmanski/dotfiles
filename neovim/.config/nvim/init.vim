""" BASIC SETUP ---

set nocompatible " Not compatible with vi
set path+=** " Search down into subfolders
set wildmenu " Display all matching files when we tab complete
set number relativenumber " Show hybrid numbers
set updatetime=100 " Change upddate time
set clipboard=unnamed " Set global clipboard
set mouse=n " Enable mouse for normal mode

""" SYNTAX START ---

syntax enable
filetype plugin on

""" CTAGS ---

command! MakeTags !ctags -R .
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

""" AUTOCOMPLETE ---

" Documentation in |ins-completion|
" USAGE:
" - ^x^n for just this file
" - ^x^f for filenames
" - ^x^] for tags only
" - ^n for anything specified by the 'coplete' option
" - ^n and ^p to go forth and back in suggestion list

""" FILE MANAGER: NETRW ---

" Documentation for mapping in |netrw-browse-maps|

let g:netrw_banner=0 " Disable banner
let g:netrw_browse_split=4 " Open in window
let g:netrw_altv=1 " Open split to the right
let g:netrw_liststyle=3 " Tree view
let g:netrw_winsize=25 " Window size

""" PLUGINS ---

call plug#begin('~/.config/nvim/plugged')
	Plug 'editorconfig/editorconfig-vim'
	Plug 'vim-airline/vim-airline'
	Plug 'tpope/vim-fugitive'
	Plug 'airblade/vim-gitgutter'
	Plug 'mattn/emmet-vim'
	Plug 'lervag/vimtex'
call plug#end()
