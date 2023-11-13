return {
	"neovim/nvim-lspconfig",
	cmd = { "LspInfo", "LspInstall", "LspStart" },
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
		{ "b0o/schemastore.nvim" },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local schemastore = require("schemastore")
		local lsp_zero = require("lsp-zero")
		lsp_zero.extend_lspconfig()

		lsp_zero.on_attach(function(client, bufnr)
			local opts = { buffer = bufnr, remap = false }

			lsp_zero.default_keymaps({ buffer = bufnr })

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
		lspconfig.jsonls.setup({
			settings = {
				json = {
					schemas = schemas,
				},
			},
		})

		lspconfig.yamlls.setup({
			settings = {
				json = {
					schemas = schemas,
				},
			},
		})

		lspconfig.lua_ls.setup({
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

		require("mason-lspconfig").setup({
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
			handlers = {
				lsp_zero.default_setup,
				lua_ls = function()
					-- (Optional) Configure lua language server for neovim
					local lua_opts = lsp_zero.nvim_lua_ls()
					require("lspconfig").lua_ls.setup(lua_opts)
				end,
			},
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				-- DAP
				"codelldb",

				-- Linter
				"shellcheck",
				"luacheck",
				"flake8",
				"cspell",

				-- Formatter
				"prettierd",
				"stylua",
				"shfmt",
			},
			run_on_start = true,
			auto_update = true,
		})
	end,
}
