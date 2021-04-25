local on_attach_no_format = require 'lsp.on_attach_no_format'

require'lspconfig'.jsonls.setup {
    settings = {
        json = {
            schemas = {
                {
                    description = 'TypeScript compiler configuration file',
                    fileMatch = {'tsconfig.json', 'tsconfig.*.json'},
                    url = 'https://json.schemastore.org/tsconfig'
                }, {
                    description = 'Lerna config',
                    fileMatch = {'lerna.json'},
                    url = 'https://json.schemastore.org/lerna'
                }, {
                    description = 'Babel configuration',
                    fileMatch = {'.babelrc.json', '.babelrc', 'babel.config.json'},
                    url = 'https://json.schemastore.org/lerna'
                }, {
                    description = 'ESLint config',
                    fileMatch = {'.eslintrc.json', '.eslintrc'},
                    url = 'https://json.schemastore.org/eslintrc'
                }, {
                    description = 'Prettier config',
                    fileMatch = {'.prettierrc', '.prettierrc.json', 'prettier.config.json'},
                    url = 'https://json.schemastore.org/prettierrc'
                }, {
                    description = 'Vercel Now config',
                    fileMatch = {'now.json'},
                    url = 'https://json.schemastore.org/now'
                }, {
                    description = 'Stylelint config',
                    fileMatch = {'.stylelintrc', '.stylelintrc.json', 'stylelint.config.json'},
                    url = 'https://json.schemastore.org/stylelintrc'
                }, {
                    description = 'Package config',
                    fileMatch = {"/package.json"},
                    url = "https://json.schemastore.org/package.json"
                }
            }
        }
    },
    on_attach = on_attach_no_format
}
