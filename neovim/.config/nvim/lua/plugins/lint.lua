return {
	"mfussenegger/nvim-lint",
	lazy = false,
	config = function()
		local nvim_lint = require("lint")

		nvim_lint.linters_by_ft = {
			lua = { "luacheck" },
			python = { "flake8" },
			sh = { "bashls" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
			group = lint_augroup,
			callback = function()
				nvim_lint.try_lint()
			end,
		})

		-- Customize diagnostics
		vim.diagnostic.config({
			virtual_text = false,
		})

		local signs = { Error = "", Warn = "", Hint = "󰋗", Info = "󰋼" }

		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end
	end,
}
