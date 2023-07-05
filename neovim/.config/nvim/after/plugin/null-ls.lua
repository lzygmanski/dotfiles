local null_ls = require("null-ls")
local mason_null_ls = require("mason-null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

mason_null_ls.setup({
	ensure_installed = {
		"prettierd",
		"eslint_d",
		"stylua",
		"luacheck",
		"flake8",
		"shfmt",
		"shellcheck",
	},
	automatic_installation = true,
})

null_ls.setup({
	sources = {
		formatting.eslint_d,
		formatting.prettierd,
		formatting.stylua,
		formatting.shfmt,
		diagnostics.eslint,
		diagnostics.flake8,
		diagnostics.luacheck,
		diagnostics.shellcheck,

		completion.spell,
	},
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})
