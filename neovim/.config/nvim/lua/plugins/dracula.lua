return {
    "dracula/vim",
    lazy = false,
    name = "dracula",
    config = function()
        vim.cmd.colorscheme("dracula")

        vim.api.nvim_set_option("termguicolors", true)
        vim.api.nvim_set_option("background", "dark")

        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "StatusLine", { bg = "#282A36" })
    end,
}
