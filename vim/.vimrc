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

" ===== Window =====
set number relativenumber
set nowrap
set list
set cursorline
set scrolloff=8
set colorcolumn=100
set signcolumn=yes
set spell

" ===== Buffer =====
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set noswapfile
set undofile
set spelllang=en,pl
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

nnoremap <leader>ev :vsp $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" ========== Custom commands ==========
command! MakeTags !ctags -R .

" ========== Auto commands ==========
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

" ========== Other settings  ==========
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
