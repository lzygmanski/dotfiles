""" BASIC SETUP ---

set encoding=UTF-8
set nocompatible
set path+=**
set wildmenu
set number relativenumber
set updatetime=100
set clipboard=unnamed
set mouse=n
set nowrap
set cmdheight=2
set shortmess+=c
set tabstop=4
set shiftwidth=4
set expandtab
set nobackup
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
set list
set autoread
set autowrite
set spelllang=en_us,pl
set spell

""" SYNTAX START ---

syntax enable
filetype plugin on

set omnifunc=syntaxcomplete#Complete

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
    " General
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'editorconfig/editorconfig-vim'
    Plug 'vim-airline/vim-airline'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'vim-test/vim-test'
    Plug 'puremourning/vimspector'
    Plug 'szw/vim-maximizer'

    " Git support
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'rbong/vim-flog'

    " Styles / Themes
    Plug 'gruvbox-community/gruvbox'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'ryanoasis/vim-devicons'

    " Syntax support
    Plug 'sheerun/vim-polyglot'

    " Snippets
    Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }

    " Others
    Plug 'ThePrimeagen/vim-be-good'
call plug#end()

" coc plugins
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
\   'coc-marketplace'
\ ]

" coc settings 
" Need to be in .vimrc to support both vim and neovim
let g:coc_user_config = {
\   'coc.preferences.formatOnSaveFiletypes': [
\     'css',
\     'markdown',
\     'javascript',
\     'javascriptreact',
\     'typescript',
\     'typescriptreact',
\     'json',
\     'graphql'
\   ],
\   'explorer.width': 40,
\   'explorer.file.column.git.showIgnored': v:true,
\   'explorer.file.showHiddenFiles': v:true,
\   'explorer.previewAction.onHover': v:true,
\   'explorer.icon.enableVimDevicons': v:true,
\   'explorer.keyMappings': {
\     '<cr>': ["expandable?", "expand", "open"],
\     'v': "open:vsplit"
\   },
\   'prettier.eslintIntegration': v:true,
\   'prettier.printWidth': 100
\ }

""" THEME ---

if has("nvim")
    colorscheme dracula 
    set termguicolors
    set t_Co=256
else
    colorscheme gruvbox 
endif

set background=dark

""" AUTO SAVE---
au FocusGained,BufEnter * :silent! !
au FocusLost,WinLeave * :silent! w

""" KEY MAPS ---

nnoremap <SPACE> <Nop>
let mapleader=" "

""" basic
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

""" git
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>

if has("nvim")
    let test#strategy = "neovim"
endif

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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" CocRestart
nnoremap <leader>cr :CocRestart

" renaming.
nmap <leader>rn <Plug>(coc-rename)
nnoremap <leader>prn :CocSearch <C-R>=expand("<cword>")

""" prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f :CocCommand prettier.formatFile<CR>
nmap <leader>f :CocCommand prettier.formatFile<CR>

""" explorer
nmap <leader>b :CocCommand explorer<CR>
nmap <leader>e :CocCommand explorer --position floating<CR>

""" fzf
nnoremap <C-p> :CocCommand fzf-preview.GitFiles<CR>
nnoremap <leader>p :CocCommand fzf-preview.DirectoryFiles<CR>
nnoremap <leader>ls :CocCommand fzf-preview.AllBuffers<CR>
nnoremap <leader>gs :CocCommand fzf-preview.GitStatus<CR>

""" Rg
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

""" Multiple cursor
nmap <expr> <silent> <C-d> <SID>select_current_word()
function! s:select_current_word()
  if !get(g:, 'coc_cursors_activated', 0)
    return "\<Plug>(coc-cursors-word)"
  endif
  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunc

""" Terminal
au TermOpen * setlocal nospell
:tnoremap <C-w>n <C-\><C-n>

function! HiddenTerminal()
  :terminal
  set bufhidden=hide
endfunction

command! HiddenTerminal call HiddenTerminal()
nnoremap <leader>t :HiddenTerminal<CR>

""" Maximizer
let g:maximizer_set_default_mapping = 0
nnoremap <leader>m :MaximizerToggle!<CR>

""" Vimspector

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

""" Edit init.vim
map <leader>v :vsp $MYVIMRC<CR>
