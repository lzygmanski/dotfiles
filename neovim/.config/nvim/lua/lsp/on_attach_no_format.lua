local on_attach = require 'lsp.on_attach'

local on_attach_no_format = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    on_attach(client, bufnr)
end

return on_attach_no_format
