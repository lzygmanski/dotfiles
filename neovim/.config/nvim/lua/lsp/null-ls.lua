local null_ls = require("null-ls")
local cspell = require("cspell")

local config = {
	find_json = function()
		return os.getenv("HOME") .. "/" .. ".cspell.json"
	end,
}

null_ls.setup({
	sources = {
		cspell.diagnostics.with({
			diagnostics_postprocess = function(diagnostic)
				diagnostic.severity = vim.diagnostic.severity.INFO
			end,
			find_json = config.find_json,
		}),
		cspell.code_actions.with({
			find_json = config.find_json,
		}),
	},
})
