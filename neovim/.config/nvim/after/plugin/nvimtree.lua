local tree_cb = require("nvim-tree.config").nvim_tree_callback

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
	update_cwd = false,
	view = {
		width = 35,
		adaptive_size = false,
		mappings = {
			custom_only = false,
			list = { { key = "l", cb = tree_cb("edit") }, { key = "h", cb = tree_cb("close_node") } },
		},
	},
	filters = {
		dotfiles = false,
	},
	git = { enable = true, ignore = false, timeout = 500 },
	diagnostics = {
		enable = true,
		icons = { hint = "", info = "", warning = "", error = "" },
	},
	update_focused_file = {
		enable = true,
		update_cwd = false,
		ignore_list = {},
	},
	system_open = {
		cmd = nil,
		args = {},
	},
})

vim.keymap.set("n", "<leader>b", vim.cmd.NvimTreeToggle, { noremap = true, silent = true })

vim.cmd("autocmd FileType LuaTree setlocal nowrap")
