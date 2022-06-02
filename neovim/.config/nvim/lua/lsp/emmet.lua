local on_attach = require('lsp.on_attach')

require'lspconfig.configs'.emmet_ls = {
    default_config = {
        cmd = {'emmet-ls', '--stdio'},
        filetypes = {
            'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'html', 'css'
        },
        root_dir = require'lspconfig'.util.root_pattern(".git", vim.fn.getcwd())
    }
}

require'lspconfig'.emmet_ls.setup {on_attach = on_attach}
