vim.api.nvim_set_keymap('n', '<leader>dl', ':call vimspector#Launch()<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>de', ':call vimspector#Reset()<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>d<leader>',
                        ':call vimspector#Continue()<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', '<leader>ds', '<Plug>VimspectorStop', {})
vim.api.nvim_set_keymap('n', '<leader>dr', '<Plug>VimspectorRestart', {})
vim.api.nvim_set_keymap('n', '<leader>dp', '<Plug>VimspectorPause', {})
vim.api.nvim_set_keymap('n', '<leader>db', '<Plug>VimspectorToggleBreakpoint',
                        {})
vim.api.nvim_set_keymap('n', '<leader>dtcb',
                        '<Plug>VimspectorToggleConditionalBreakpoint', {})
vim.api.nvim_set_keymap('n', '<leader>dfb',
                        '<Plug>VimspectorAddFunctionBreakpoint', {})
vim.api.nvim_set_keymap('n', '<leader>do', '<Plug>VimspectorStepOver', {})
vim.api.nvim_set_keymap('n', '<leader>di', '<Plug>VimspectorStepInto', {})
vim.api.nvim_set_keymap('n', '<leader>da', '<Plug>VimspectorStepOut', {})
vim.api.nvim_set_keymap('n', '<leader>dmc', '<Plug>VimspectorRunToCursor', {})
