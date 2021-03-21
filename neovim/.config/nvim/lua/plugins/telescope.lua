local options = {
    noremap = true,
    silent = true
}

vim.api.nvim_set_keymap('n', '<leader>p', [[<cmd>lua require('telescope.builtin').git_files()<cr>]], options)
vim.api.nvim_set_keymap('n', '<C-p>', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], options)
vim.api.nvim_set_keymap('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], options)
vim.api.nvim_set_keymap('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], options)
vim.api.nvim_set_keymap('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<cr>]], options)
vim.api.nvim_set_keymap('n', '<leader>fc', [[<cmd>lua require('telescope.builtin').git_commits()<cr>]], options)
vim.api.nvim_set_keymap('n', '<leader>gs', [[<cmd>lua require('telescope.builtin').git_status()<cr>]], options)
