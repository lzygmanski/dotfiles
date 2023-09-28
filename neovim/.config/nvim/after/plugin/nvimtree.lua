local tree_cb = require("nvim-tree.config").nvim_tree_callback

local gheight = vim.api.nvim_list_uis()[1].height
local gwidth = vim.api.nvim_list_uis()[1].width
local width = 100
local height = 30

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
	update_cwd = false,
	view = {
		number = true,
		relativenumber = true,
		signcolumn = "yes",
		mappings = {
			custom_only = false,
			list = {
				{ key = "l", cb = tree_cb("edit") },
				{ key = "h", cb = tree_cb("close_node") },
			},
		},
		float = {
			enable = true,
			open_win_config = {
				relative = "editor",
				width = width,
				height = height,
				row = (gheight - height) * 0.5,
				col = (gwidth - width) * 0.5,
			},
		},
	},
	renderer = {
		highlight_git = true,
		highlight_opened_files = "icon",
		indent_width = 1,
		indent_markers = {
			enable = true,
		},
		icons = {
			git_placement = "after",
		},
	},
	update_focused_file = {
		enable = true,
	},
	diagnostics = {
		enable = true,
	},
	filters = {
		dotfiles = false,
	},
	actions = {
		open_file = {
			resize_window = false,
		},
	},
})

vim.keymap.set("n", "<leader>b", vim.cmd.NvimTreeToggle, { noremap = true, silent = true })

vim.cmd("autocmd FileType LuaTree setlocal nowrap")
