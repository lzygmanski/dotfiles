" ========== Options ========== "

set encoding=UTF-8
set nocompatible
set updatetime=50
set clipboard=unnamed
set mouse=n
set exrc
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set list
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
set nowrap
set number relativenumber
set cursorline
set scrolloff=8
set completeopt=menuone,noinsert,noselect
set colorcolumn=80
set signcolumn=yes
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set nohlsearch
set incsearch
set hidden
set noerrorbells
set autoread
set autowrite
set wildmenu
set shortmess+=c
set spelllang=en_us,pl
set spell
set omnifunc=syntaxcomplete#Complete

syntax enable
filetype plugin on

let g:netrw_browse_split=4 " Open in window
let g:netrw_altv=1 " Open split to the right
let g:netrw_liststyle=3 " Tree view
let g:netrw_winsize=25 " Window size

" ========== Plugins ========== "

let g:coc_global_extensions = ['coc-json', 'coc-git']

call plug#begin('~/.config/nvim/plugged')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'editorconfig/editorconfig-vim'
    Plug 'vim-airline/vim-airline'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'vim-test/vim-test'
    Plug 'puremourning/vimspector'
    Plug 'szw/vim-maximizer'
    Plug 'mbbill/undotree'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'rbong/vim-flog'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'ryanoasis/vim-devicons'
    Plug 'sheerun/vim-polyglot'
    Plug 'lepture/vim-velocity'
    Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }
    Plug 'ThePrimeagen/vim-be-good'
call plug#end()

" ========== Theme ========== "

colorscheme dracula 
set termguicolors
set t_Co=256
set background=dark

" ========== Auto save ========== "

au FocusGained,BufEnter * :silent! !
au FocusLost,WinLeave * :silent! w

" ========== Test ========== "

let test#strategy = "neovim"

" ========== Key Maps ========== "

nnoremap <SPACE> <Nop>
let mapleader=" "

" === Undotree === "
nnoremap <leader>u :UndotreeToggle<CR>

" === maximizer === "
let g:maximizer_set_default_mapping = 0
nnoremap <leader>m :MaximizerToggle!<CR>

" === Vimspector === "

nnoremap <leader>dl :call vimspector#Launch()<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>
nnoremap <leader>d<leader> :call vimspector#Continue()<CR>

nmap <leader>ds <Plug>VimspectorStop
nmap <leader>dr <Plug>VimspectorRestart
nmap <leader>dp <Plug>VimspectorPause
nmap <leader>db <Plug>VimspectorToggleBreakpoint
nmap <leader>dtcb <Plug>VimspectorToggleConditionalBreakpoint
nmap <leader>dfb <Plug>VimspectorAddFunctionBreakpoint
nmap <leader>do <Plug>VimspectorStepOver
nmap <leader>di <Plug>VimspectorStepInto
nmap <leader>da <Plug>VimspectorStepOut
nmap <leader>dmc <Plug>VimspectorRunToCursor

" === Coc === "

let g:coc_global_extensions = [
\   'coc-tsserver',
\   'coc-vetur',
\   'coc-json',
\   'coc-yaml',
\   'coc-html',
\   'coc-css',
\   'coc-emmet',
\   'coc-tslint',
\   'coc-eslint',
\   'coc-prettier',
\   'coc-explorer',
\   'coc-snippets',
\   'coc-pairs',
\   'coc-fzf-preview',
\   'coc-marketplace',
\   'coc-python',
\   'coc-jedi',
\   'coc-pyright'
\ ]

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

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f :CocCommand prettier.formatFile<CR>
nmap <leader>f :CocCommand prettier.formatFile<CR>

" Explorer
nmap <leader>e :CocCommand explorer<CR>
nmap <leader>b :CocCommand explorer --position floating<CR>

" fzf
nnoremap <C-p> :CocCommand fzf-preview.GitFiles<CR>
nnoremap <leader>p :CocCommand fzf-preview.DirectoryFiles<CR>
nnoremap <leader>ls :CocCommand fzf-preview.AllBuffers<CR>
nnoremap <leader>gs :CocCommand fzf-preview.GitStatus<CR>
nnoremap <leader>fd :CocCommand fzf-preview.CocDiagnostics <CR>

" ========== Edit vim config ========== "
map <leader>v :vsp $MYVIMRC<CR>
