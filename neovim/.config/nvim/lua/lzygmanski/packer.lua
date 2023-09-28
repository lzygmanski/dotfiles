vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({ "dracula/vim", as = "dracula" })

	use("editorconfig/editorconfig-vim")
	use("jremmen/vim-ripgrep")
	use("mbbill/undotree")

	use("folke/which-key.nvim")

	use("tpope/vim-surround")
	use("tpope/vim-commentary")
	use("tpope/vim-fugitive")

	use("rbong/vim-flog")
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
	use("lewis6991/gitsigns.nvim")

	use("ThePrimeagen/vim-be-good")

	use({ "nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" } })
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })
	use("windwp/nvim-autopairs")

	use("b0o/schemastore.nvim")
	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

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
	use("onsails/lspkind.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
		tag = "nightly",
	})

	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	use("folke/neodev.nvim")

	use({
		"David-Kunz/cmp-npm",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
end)
