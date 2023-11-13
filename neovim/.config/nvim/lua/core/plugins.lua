require("lazy").setup({
	-- Theme / Visuals
	require("plugins.dracula"),
	require("plugins.nvim-notify"),
	{ "stevearc/dressing.nvim" },

	-- Basic
	{ "ThePrimeagen/vim-be-good" },
	{ "editorconfig/editorconfig-vim" },
	{ "tpope/vim-commentary" },
	{ "tpope/vim-surround" },
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},
	require("plugins.symbols-outline"),

	-- History
	require("plugins.undotree"),

	-- Git
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{ "tpope/vim-fugitive" },
	{
		"rbong/vim-flog",
		lazy = true,
		cmd = { "Flog", "Flogsplit", "Floggit" },
		dependencies = {
			"tpope/vim-fugitive",
		},
	},

	-- Navigation
	require("plugins.nvim-tree"),
	require("plugins.telescope"),

	-- Lsp
	require("plugins.lsp-zero"),
	require("plugins.mason"),
	require("plugins.nvim-cmp"),
	require("plugins.nvim-lspconfig"),

	-- Treesitter
	require("plugins.nvim-treesitter"),

	-- Formatters
	require("plugins.conform"),

	-- Linters
	require("plugins.lint"),
	-- TODO replace to other supported package - need for spell code action
	require("plugins.cspell"),

	-- Neovim dev
	{ "folke/neodev.nvim" },
})
