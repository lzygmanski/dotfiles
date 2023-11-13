return {
	"rcarriga/nvim-notify",
	dependencies = {
		{ "nvim-telescope/telescope.nvim" },
	},
	config = function()
		local notify = require("notify")

		notify.setup({
			background_colour = "#000000",
		})

		require("telescope").load_extension("notify")
		vim.notify = notify
	end,
}
