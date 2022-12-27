vim.g.mapleader = " "

--- Global
vim.opt.updatetime = 50
vim.opt.mouse = "n"
--- vim.opt.autowriteall = true
vim.opt.listchars = "eol:¬,tab:>·,trail:~,extends:>,precedes:<"
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.clipboard = "unnamedplus"

--- Window
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.list = true
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.colorcolumn = "100"
vim.opt.signcolumn = "yes"

--- Buffer
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.spelllang = "en"
vim.opt.complete = ".,w,b,u,t,i,kspell"
vim.opt.omnifunc = "syntaxcomplete#Complete"

--- Plugins
vim.g.rg_command = "rg --vimgrep -S"

--- Keys
vim.keymap.set("x", "<leader>p", '"_dP', { noremap = true })

--- Aucmd
local MYAUCMDS = vim.api.nvim_create_augroup("MYAUCMDS", { clear = true })
vim.api.nvim_create_autocmd(
	{ "TextYankPost" },
	{ group = MYAUCMDS, pattern = "*", command = [[silent! lua vim.highlight.on_yank()]] }
)
vim.api.nvim_create_autocmd({ "BufWritePre" }, { group = MYAUCMDS, pattern = "*", command = [[:%s/\s\+$//e]] })
