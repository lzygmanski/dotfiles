" ========== Default Vim Settings ==========

source ~/.vimrc

" ========== Plugins ==========

call plug#begin('~/.config/nvim/plugged')
    Plug 'editorconfig/editorconfig-vim'

    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }

    Plug 'euclidianAce/BetterLua.vim'

    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/playground'
    Plug 'p00f/nvim-ts-rainbow'

    Plug 'mbbill/undotree'

    Plug 'vim-test/vim-test'

    Plug 'puremourning/vimspector'
    Plug 'szw/vim-maximizer'

    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'rbong/vim-flog'

    Plug 'dracula/vim', { 'as': 'dracula' }

    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'kyazdani42/nvim-tree.lua'

    Plug 'sbdchd/neoformat'

    Plug 'liuchengxu/vim-which-key'

    Plug 'ThePrimeagen/vim-be-good'
call plug#end()

lua require('plugins')
lua require('lsp')

" ========== Theme ==========

colorscheme dracula
set termguicolors
set background=dark
hi Normal guibg=NONE ctermbg=NONE

" ========== Autocmds ==========

augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup end

" ========== Others ==========

let g:neoformat_run_all_formatters = 1

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

highlight link CompeDocumentation NormalFloat

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

