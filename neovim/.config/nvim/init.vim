" ========== Default Vim Settings ==========

source ~/.vimrc

" ========== Plugins ==========

call plug#begin('~/.config/nvim/plugged')
    Plug 'editorconfig/editorconfig-vim'

    Plug 'neovim/nvim-lspconfig'
    Plug 'tjdevries/nlua.nvim'

    Plug 'euclidianAce/BetterLua.vim'
    Plug 'jparise/vim-graphql'

    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'

    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'

    Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }
    Plug 'rafamadriz/friendly-snippets'

    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'jremmen/vim-ripgrep'

    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'nvim-treesitter/playground'
    Plug 'p00f/nvim-ts-rainbow'

    Plug 'mbbill/undotree'

    Plug 'vim-test/vim-test'

    Plug 'puremourning/vimspector'
    Plug 'szw/vim-maximizer'

    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'rbong/vim-flog'
    Plug 'ThePrimeagen/git-worktree.nvim'

    Plug 'dracula/vim', { 'as': 'dracula' }

    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'kyazdani42/nvim-tree.lua'

    Plug 'NTBBloodbath/galaxyline.nvim' , {'branch': 'main'}
    Plug 'folke/which-key.nvim'

    Plug 'airblade/vim-rooter'
    Plug 'sbdchd/neoformat'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'

    Plug 'ThePrimeagen/vim-be-good'
call plug#end()

lua require('plugins')
lua require('lsp')

" ========== Theme ==========

colorscheme dracula
set termguicolors
set background=dark
hi Normal guibg=NONE ctermbg=NONE
hi StatusLine guibg=#282A36

" ========== Autocmds ==========

augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup end

autocmd WinEnter,TabEnter,FocusGained * checktime

" ========== Others ==========
let g:rg_command = 'rg --vimgrep -S'

set inccommand=split

