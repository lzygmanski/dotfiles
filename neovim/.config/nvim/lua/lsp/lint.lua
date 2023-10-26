local nvim_lint = require("lint")

-- eslint is added by mason-lspconfig

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
	-- virtual_text = { spacing = 0, prefix = "!" },
	virtual_text = false,
})

-- vim.api.nvim_create_autocmd({ "CursorHold" }, {
-- 	callback = function()
-- 		if vim.lsp.buf.server_ready() then
-- 			vim.diagnostic.open_float()
-- 		end
-- 	end,
-- })
