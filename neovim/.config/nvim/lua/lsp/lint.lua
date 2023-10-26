local nvim_lint = require("lint")

-- eslint is added by mason-lspconfig

nvim_lint.linters_by_ft = {
	javascript = { "cspell" },
	typescript = { "cspell" },
	javascriptreact = { "cspell" },
	typescriptreact = { "cspell" },
	svelte = { "cspell" },
	lua = { "luacheck", "cspell" },
	python = { "flake8", "cspell" },
	sh = { "bashls", "cspell" },
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
	virtual_text = { spacing = 0, prefix = "!" },
})
