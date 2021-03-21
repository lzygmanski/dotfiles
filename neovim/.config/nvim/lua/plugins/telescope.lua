local opts = {noremap = true, silent = true}

vim.api.nvim_set_keymap('n', '<leader>p',
                        [[<cmd>lua require('telescope.builtin').git_files()<cr>]],
                        opts)
vim.api.nvim_set_keymap('n', '<C-p>',
                        [[<cmd>lua require('telescope.builtin').find_files()<cr>]],
                        opts)
vim.api.nvim_set_keymap('n', '<leader>fg',
                        [[<cmd>lua require('telescope.builtin').live_grep()<cr>]],
                        opts)
vim.api.nvim_set_keymap('n', '<leader>fb',
                        [[<cmd>lua require('telescope.builtin').buffers()<cr>]],
                        opts)
vim.api.nvim_set_keymap('n', '<leader>fh',
                        [[<cmd>lua require('telescope.builtin').help_tags()<cr>]],
                        opts)
vim.api.nvim_set_keymap('n', '<leader>fc',
                        [[<cmd>lua require('telescope.builtin').git_commits()<cr>]],
                        opts)
vim.api.nvim_set_keymap('n', '<leader>gs',
                        [[<cmd>lua require('telescope.builtin').git_status()<cr>]],
                        opts)

