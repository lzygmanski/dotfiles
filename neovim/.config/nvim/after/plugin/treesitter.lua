require("nvim-treesitter.configs").setup({
	ensure_installed = "all",
	sync_install = false,
	auto_install = true,
	autotag = {
		enable = true,
	},
	highlight = {
		enable = true,
	},
})
