local on_attach = require 'lsp.onAttach'

local on_attach_no_format = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    on_attach(client, bufnr)
end

return on_attach_no_format
