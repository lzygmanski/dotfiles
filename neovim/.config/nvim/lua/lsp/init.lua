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

