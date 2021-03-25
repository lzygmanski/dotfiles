local nvim_lsp = require 'lspconfig'
local on_attach = require 'lsp.onAttach'
local on_attach_no_format = require 'lsp.onAttachNoFormat'

local servers = {
    "dockerls",
    "pyright",
    "vimls"
}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

local servers_no_format = {
    "bashls",
    "cssls",
    "graphql",
    "html",
    "jsonls",
    "yamlls",
    "vuels",
    "tsserver"
}

for _, lsp in ipairs(servers_no_format) do
  nvim_lsp[lsp].setup { on_attach = on_attach_no_format }
end

require 'lsp.efm'
require 'lsp.lua'

vim.api.nvim_exec([[
    sign define LspDiagnosticsSignError text=綠 texthl=LspDiagnosticsSignError linehl= numhl=
    sign define LspDiagnosticsSignWarning text=綠 texthl=LspDiagnosticsSignWarning linehl= numhl=
    sign define LspDiagnosticsSignInformation text=綠 texthl=LspDiagnosticsSignInformation linehl= numhl=
    sign define LspDiagnosticsSignHint text=綠 texthl=LspDiagnosticsSignHint linehl= numhl=
]], true)

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
                 {virtual_text = {spacing = 0, prefix = '!'}});
