local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.diagnostics.cspell,
		null_ls.builtins.code_actions.cspell,
	},
})
