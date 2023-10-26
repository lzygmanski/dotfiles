local lsp_zero = require("lsp-zero")
local schemastore = require("schemastore")

lsp_zero.preset("recommended")

lsp_zero.set_preferences({
	sign_icons = {
		hint = "󰋗",
		info = "󰋼",
		warn = "",
		error = "",
	},
})

lsp_zero.on_attach(function(client, buffer)
	local opts = { buffer = buffer, remap = false }

	lsp_zero.default_keymaps({ buffer = buffer })

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

local schemas = schemastore.json.schemas()

lsp_zero.configure("jsonls", {
	settings = {
		json = {
			schemas = schemas,
		},
	},
})

lsp_zero.configure("yamlls", {
	settings = {
		yaml = {
			schemas = schemas,
		},
	},
})

lsp_zero.configure("sumneko_lua", {
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

lsp_zero.setup()
