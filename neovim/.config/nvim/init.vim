""" BASIC SETUP ---

set nocompatible " Not compatible with vi
set path+=** " Search down into subfolders
set wildmenu " Display all matching files when we tab complete
set number relativenumber " Show hybrid numbers
set updatetime=100 " Change upddate time
set clipboard=unnamed " Set global clipboard
set mouse=n " Enable mouse for normal mode

set cmdheight=2
set shortmess+=c


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
" https://shapeshed.com/vim-netrw/

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
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'neoclide/coc.nvim'
	Plug 'morhetz/gruvbox'
	Plug 'posva/vim-vue'
call plug#end()

colorscheme gruvbox
set background=dark

""" KEY MAPS ---

nnoremap <SPACE> <Nop>

let mapleader=" "

""" basic
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

""" git
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>

""" coc

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

