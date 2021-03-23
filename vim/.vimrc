set nocompatible

" ========== General settings ==========
syntax on
filetype plugin on

" ===== Global =====
set encoding=UTF-8
set updatetime=50
set exrc
set mouse=n
set backspace=indent,eol,start
set noerrorbells
set belloff=all
set showcmd
set showmode
set autoread
set autowriteall
set hidden
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
set completeopt=menuone,noinsert,noselect
set nobackup
set undodir=~/.vim/undodir
set nohlsearch
set incsearch
set ignorecase
set smartcase
set wildmenu
set shortmess+=c
set path+=**
set clipboard=unnamedplus

" ===== Window =====
set number relativenumber
set nowrap
set list
set cursorline
set scrolloff=8
set colorcolumn=100
set signcolumn=yes
"set spell

" ===== Buffer =====
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set noswapfile
set undofile
set spelllang=en
set complete=.,w,b,u,t,i,kspell
set omnifunc=syntaxcomplete#Complete

" ===== netrw =====
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_winsize=25

" ========== Mappings ==========
nnoremap <SPACE> <Nop>
let mapleader=" "

map <leader>ve :vsp $MYVIMRC<CR>
map <leader>vs :source $MYVIMRC<CR>

" ========== Custom commands ==========
command! MakeTags !ctags -R .

" ========== Auto commands ==========
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()
