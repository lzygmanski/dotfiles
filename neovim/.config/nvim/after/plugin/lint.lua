local nvim_lint = require("lint")

nvim_lint.linters_by_ft = {
	javascript = { "eslint_d" },
	typescript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	svelte = { "eslint_d" },
	lua = { "luacheck" },
	python = { "flake8" },
	sh = { "bashls" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		nvim_lint.try_lint()
	end,
})

-- Customize diagnostics

vim.diagnostic.config({
	virtual_text = { spacing = 0, prefix = "!" },
})
