" ========== Default Vim Settings ==========

source ~/.vimrc

" ========== Plugins ==========

call plug#begin('~/.config/nvim/plugged')
    Plug 'editorconfig/editorconfig-vim'

    Plug 'neovim/nvim-lspconfig'
    Plug 'tjdevries/nlua.nvim'

    Plug 'euclidianAce/BetterLua.vim'
    Plug 'jparise/vim-graphql'

    Plug 'hrsh7th/nvim-compe'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }

    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

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

    Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

    Plug 'sbdchd/neoformat'

    Plug 'liuchengxu/vim-which-key'

    Plug 'jiangmiao/auto-pairs'

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

