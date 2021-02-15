" ========== Default Vim Settings ==========
source ~/.vimrc

" ========== Plugins ==========
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

" ========== Theme ==========
colorscheme dracula 
set termguicolors
set t_Co=256
set background=dark

" ========== Auto save ==========
au FocusGained,BufEnter * :silent! !
au FocusLost,WinLeave * :silent! w

" ========== Plugins settings ==========
"
" ===== vim-test =====
let test#strategy = "neovim"

" ===== undotree =====
nnoremap <leader>u :UndotreeToggle<CR>

" ===== maximizer =====
let g:maximizer_set_default_mapping = 0
nnoremap <leader>m :MaximizerToggle!<CR>

" ===== vimspector =====
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

" ===== coc.nvim =====
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

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)

nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f :CocCommand prettier.formatFile<CR>
nmap <leader>f :CocCommand prettier.formatFile<CR>

nmap <leader>e :CocCommand explorer<CR>
nmap <leader>b :CocCommand explorer --position floating<CR>

nnoremap <C-p> :CocCommand fzf-preview.GitFiles<CR>
nnoremap <leader>p :CocCommand fzf-preview.DirectoryFiles<CR>
nnoremap <leader>ls :CocCommand fzf-preview.AllBuffers<CR>
nnoremap <leader>gs :CocCommand fzf-preview.GitStatus<CR>
nnoremap <leader>fd :CocCommand fzf-preview.CocDiagnostics <CR>

