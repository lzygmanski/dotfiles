vim.g.nvim_tree_side = 'left'
vim.g.nvim_tree_width = 35
vim.g.nvim_tree_auto_open = 0
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_indent_markers = 0
vim.g.nvim_tree_hide_dotfiles = 0
vim.g.nvim_tree_git_hl = 0
vim.g.nvim_tree_width_allow_resize  = 1

local tree_cb = require'nvim-tree.config'.nvim_tree_callback

vim.g.nvim_tree_bindings = {
  ["l"] = tree_cb("edit"),
  ["h"] = tree_cb("close_node"),
}

vim.api.nvim_set_keymap('n', '<Leader>b', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- disable word wrap
vim.cmd('autocmd FileType LuaTree setlocal nowrap')
