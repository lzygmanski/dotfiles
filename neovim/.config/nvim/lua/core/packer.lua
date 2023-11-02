vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Vim Learning
	use("ThePrimeagen/vim-be-good")

	-- General Helpers
	use("editorconfig/editorconfig-vim")
	use("jremmen/vim-ripgrep")
	use("mbbill/undotree")
	use("folke/which-key.nvim")
	use("tpope/vim-surround")
	use("tpope/vim-commentary")

	use("rcarriga/nvim-notify")

	-- Git
	use("tpope/vim-fugitive")
	use("tpope/vim-rhubarb")
	use("rbong/vim-flog")
	use("lewis6991/gitsigns.nvim")
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use({ "nvim-treesitter/nvim-treesitter-textobjects" })
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })
	use({ "windwp/nvim-autopairs" })

	-- JSON & YML schema source
	use("b0o/schemastore.nvim")

	-- LSP
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("WhoIsSethDaniel/mason-tool-installer.nvim")

	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- Lsp Support
			{ "neovim/nvim-lspconfig" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
			{ "honza/vim-snippets" },
		},
	})

	-- TODO replace to other supported package - need for spell code action
	use("jose-elias-alvarez/null-ls.nvim")
	use("davidmh/cspell.nvim")

	-- Formatter
	use("stevearc/conform.nvim")

	-- Linter
	use("mfussenegger/nvim-lint")

	-- Visual & Theme
	use({ "dracula/vim", as = "dracula" })
	use("stevearc/dressing.nvim")
	use("onsails/lspkind.nvim")

	-- File finders / tree
	use({
		"nvim-telescope/telescope.nvim",
		requires = "nvim-lua/plenary.nvim",
	})

	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
		tag = "nightly",
	})

	-- Symbols tree
	use("simrat39/symbols-outline.nvim")

	-- Nvim dev tools helpers
	use("folke/neodev.nvim")
end)
