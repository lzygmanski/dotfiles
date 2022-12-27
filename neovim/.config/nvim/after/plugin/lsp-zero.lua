local lsp = require("lsp-zero")
local cmp = require("cmp")
local lspkind = require("lspkind")
local schemastore = require("schemastore")
local neodev = require("neodev")

local schemas = schemastore.json.schemas()

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
			schemas = schemas,
		},
	},
})

lsp.configure("yamlls", {
	settings = {
		yaml = {
			schemas = schemas,
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

vim.diagnostic.config({
	virtual_text = { spacing = 0, prefix = "!" },
})
