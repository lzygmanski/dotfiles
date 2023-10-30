local symbols_outline = require("symbols-outline")

symbols_outline.setup()

vim.keymap.set("n", "<leader>s", vim.cmd.SymbolsOutline)
