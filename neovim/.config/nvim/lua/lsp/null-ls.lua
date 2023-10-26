local null_ls = require("null-ls")
local cspell = require("cspell")

null_ls.setup({
	sources = {
		cspell.diagnostics.with({
			diagnostics_postprocess = function(diagnostic)
				diagnostic.severity = vim.diagnostic.severity.INFO
			end,
			find_json = function()
				return os.getenv("HOME") .. "/" .. ".cspell.json"
			end,
		}),
		cspell.code_actions,
	},
})
