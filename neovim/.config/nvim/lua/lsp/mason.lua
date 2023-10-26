local lsp_zero = require("lsp-zero")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_tool_installer = require("mason-tool-installer")

mason.setup()

mason_lspconfig.setup({
	handlers = {
		lsp_zero.default_setup,
	},
	ensure_installed = {
		-- Lsp
		"lua_ls",
		"jsonls",
		"emmet_ls",
		"yamlls",
		"dockerls",
		"pyright",
		"vimls",
		"bashls",
		"cssls",
		"graphql",
		"html",
		"vuels",
		"tsserver",
		"tailwindcss",

		-- Linter
		"eslint",
	},
	automatic_installation = true,
})

mason_tool_installer.setup({
	ensure_installed = {
		-- DAP
		"codelldb",

		-- Linter
		"shellcheck",
		"luacheck",
		"flake8",
		"codespell",
		"cspell",

		-- Formatter
		"prettierd",
		"stylua",
		"shfmt",
	},
})
