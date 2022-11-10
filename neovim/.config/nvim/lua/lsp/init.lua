local nvim_lsp = require 'lspconfig'
local on_attach = require 'lsp.on_attach'
local on_attach_no_format = require 'lsp.on_attach_no_format'

local capabilities = vim.lsp.protocol.make_client_capabilities()

local servers = {"dockerls", "pyright", "vimls"}
local servers_no_format = {"bashls", "cssls", "graphql", "html", "vuels", "tsserver"}

for _, lsp in ipairs(servers) do nvim_lsp[lsp].setup {on_attach = on_attach} end
for _, lsp in ipairs(servers_no_format) do nvim_lsp[lsp].setup {on_attach = on_attach_no_format} end

nvim_lsp.angularls.setup {}

require 'lsp.efm'
require 'lsp.lua'
require 'lsp.emmet'
require 'lsp.json'
require 'lsp.yml'

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = {noremap = true, silent = true}
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

vim.api.nvim_exec([[
    sign define LspDiagnosticsSignError text=綠 texthl=LspDiagnosticsSignError linehl= numhl=
    sign define LspDiagnosticsSignWarning text=綠 texthl=LspDiagnosticsSignWarning linehl= numhl=
    sign define LspDiagnosticsSignInformation text=綠 texthl=LspDiagnosticsSignInformation linehl= numhl=
    sign define LspDiagnosticsSignHint text=綠 texthl=LspDiagnosticsSignHint linehl= numhl=
]], true)

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
                 {virtual_text = {spacing = 0, prefix = '!'}});

capabilities.textDocument.completion.completionItem.snippetSupport = true
