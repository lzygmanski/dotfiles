local on_attach_no_format = require 'lsp.on_attach_no_format'

require'lspconfig'.yamlls.setup {
    settings = {
        yaml = {
            schemas = {
                ['https://json.schemastore.org/github-workflow'] = '.github/workflows/*.{yml,yaml}',
                ['https://json.schemastore.org/github-action'] = '.github/action.{yml,yaml}',
                ['https://json.schemastore.org/ansible-stable-2.9'] = 'roles/tasks/*.{yml,yaml}',
                ['https://json.schemastore.org/prettierrc'] = '.prettierrc.{yml,yaml}',
                ['https://json.schemastore.org/stylelintrc'] = '.stylelintrc.{yml,yaml}',
                ['https://json.schemastore.org/circleciconfig'] = '.circleci/**/*.{yml,yaml}',
                ['https://json.schemastore.org/gitlab-ci.json'] = '.gitlab-ci.{yml,yaml}'
            }
        }
    },
    on_attach = on_attach_no_format
}
