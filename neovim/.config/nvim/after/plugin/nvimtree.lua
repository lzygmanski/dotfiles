local tree_cb = require("nvim-tree.config").nvim_tree_callback

local g_height = vim.api.nvim_list_uis()[1].height
local g_width = vim.api.nvim_list_uis()[1].width
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
				{ key = "<esc>", cb = vim.cmd.NvimTreeToggle },
			},
		},
		float = {
			enable = true,
			open_win_config = {
				relative = "editor",
				width = width,
				height = height,
				row = (g_height - height) * 0.5,
				col = (g_width - width) * 0.5,
			},
		},
	},
	renderer = {
		highlight_git = true,
		highlight_opened_files = "icon",
		indent_markers = {
			enable = true,
		},
		icons = {
			git_placement = "signcolumn",
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

vim.keymap.set("n", "<leader>b", vim.cmd.NvimTreeToggle, { noremap = true, silent = true, desc = "Nvim tree" })

vim.cmd("autocmd FileType LuaTree setlocal nowrap")
