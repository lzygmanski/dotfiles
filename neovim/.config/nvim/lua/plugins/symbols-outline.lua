return {
    "simrat39/symbols-outline.nvim",
    config = function()
        require("symbols-outline").setup()

        vim.keymap.set("n", "<leader>s", vim.cmd.SymbolsOutline, { desc = "[S]ymbol outline" })
    end
}
