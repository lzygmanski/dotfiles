local on_attach = require 'lsp.onAttach'

require'lspconfig'.bashls.setup {on_attach = on_attach}
require'lspconfig'.cssls.setup {on_attach = on_attach}
require'lspconfig'.dockerls.setup {on_attach = on_attach}
require'lspconfig'.graphql.setup {on_attach = on_attach}
require'lspconfig'.html.setup {on_attach = on_attach}
require'lspconfig'.jsonls.setup {on_attach = on_attach}
require'lspconfig'.pyright.setup {on_attach = on_attach}
require'lspconfig'.vimls.setup {on_attach = on_attach}
require'lspconfig'.yamlls.setup {on_attach = on_attach}
require'lspconfig'.vuels.setup {on_attach = on_attach}

require'lspconfig'.tsserver.setup {on_attach = on_attach, settings = {documentFormatting = false}}

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
