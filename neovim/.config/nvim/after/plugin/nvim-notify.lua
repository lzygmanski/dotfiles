local notify = require("notify")
local telescope = require("telescope")

notify.setup({
	background_colour = "#000000",
})

telescope.load_extension("notify")
vim.notify = notify
