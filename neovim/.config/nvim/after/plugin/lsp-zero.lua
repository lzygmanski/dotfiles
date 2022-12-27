local lsp = require("lsp-zero")
local cmp = require("cmp")
local lspkind = require("lspkind")
local neodev = require("neodev")

neodev.setup()

lsp.preset("recommended")
lsp.ensure_installed({
	"sumneko_lua",
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
})

lsp.set_preferences({
	sign_icons = {
		hint = "",
		info = "",
		warn = "",
		error = "",
	},
})

lsp.on_attach(function(client, buffer)
	local opts = { buffer = buffer, remap = false }

	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)

	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<space>f", function()
		vim.lsp.buf.format({ async = true })
	end, opts)

	vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)

	-- Set autocommands conditional on server_capabilities
	if client.server_capabilities.documentHighlightProvider then
		vim.api.nvim_exec(
			[[
          hi LspReferenceRead cterm=bold ctermbg=red guibg=Gray
          hi LspReferenceText cterm=bold ctermbg=red guibg=Gray
          hi LspReferenceWrite cterm=bold ctermbg=red guibg=Gray
          augroup lsp_document_highlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
          augroup END
        ]],
			false
		)
	end
end)

lsp.configure("jsonls", {
	settings = {
		json = {
			schemas = {
				{
					description = "TypeScript compiler configuration file",
					fileMatch = { "tsconfig.json", "tsconfig.*.json" },
					url = "https://json.schemastore.org/tsconfig",
				},
				{
					description = "Lerna config",
					fileMatch = { "lerna.json" },
					url = "https://json.schemastore.org/lerna",
				},
				{
					description = "Babel configuration",
					fileMatch = { ".babelrc.json", ".babelrc", "babel.config.json" },
					url = "https://json.schemastore.org/lerna",
				},
				{
					description = "ESLint config",
					fileMatch = { ".eslintrc.json", ".eslintrc" },
					url = "https://json.schemastore.org/eslintrc",
				},
				{
					description = "Prettier config",
					fileMatch = { ".prettierrc", ".prettierrc.json", "prettier.config.json" },
					url = "https://json.schemastore.org/prettierrc",
				},
				{
					description = "Vercel Now config",
					fileMatch = { "now.json" },
					url = "https://json.schemastore.org/now",
				},
				{
					description = "Stylelint config",
					fileMatch = { ".stylelintrc", ".stylelintrc.json", "stylelint.config.json" },
					url = "https://json.schemastore.org/stylelintrc",
				},
				{
					description = "Package config",
					fileMatch = { "package.json" },
					url = "https://json.schemastore.org/package.json",
				},
			},
		},
	},
})

lsp.configure("yamlls", {
	settings = {
		yaml = {
			schemas = {
				["https://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
				["https://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
				["https://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
				["https://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
				["https://json.schemastore.org/stylelintrc"] = ".stylelintrc.{yml,yaml}",
				["https://json.schemastore.org/circleciconfig"] = ".circleci/**/*.{yml,yaml}",
				["https://json.schemastore.org/gitlab-ci.json"] = ".gitlab-ci.{yml,yaml}",
			},
		},
	},
})

lsp.configure("sumneko_lua", {
	settings = {
		Lua = {
			completion = {
				callSnippet = "Replace",
			},
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

lsp.setup()

local cmp_config = lsp.defaults.cmp_config({
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text",
		}),
	},
})

cmp.setup(cmp_config)
