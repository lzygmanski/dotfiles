local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.builtin, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

vim.keymap.set("n", "<leader>p", builtin.git_files, {})
vim.keymap.set("n", "<C-p>", builtin.find_files, {})

vim.keymap.set("n", "<leader>gs", builtin.git_status, {})
