local eslint = {
    lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true
}

local prettier = {formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}

local prettier_eslint = {
    formatCommand = "prettier_eslint --stdin --stdin-filepath ${INPUT}",
    formatStdin = true
}

local luaFormat = {
    formatCommand = "lua-format -i --no-keep-simple-function-one-line --column-limit=100",
    formatStdin = true
}

local shellcheck = {
    LintCommand = 'shellcheck -f gcc -x',
    lintFormats = {'%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m', '%f:%l:%c: %tote: %m'}
}

local shfmt = {formatCommand = 'shfmt -ci -s -bn', formatStdin = true}

local flake8 = {
    LintCommand = "flake8 --ignore=E501 --stdin-display-name ${INPUT} -",
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"}
}

require'lspconfig'.efm.setup {
    on_attach = function(client, bufnr)
        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end

        local opts = {noremap = true, silent = true}

        if client.resolved_capabilities.document_formatting then
            buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
            vim.api.nvim_exec([[
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)
            ]], false)
        elseif client.resolved_capabilities.document_range_formatting then
            buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
        end
    end,
    init_options = {documentFormatting = true, codeAction = true},
    filetypes = {
        'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'html', 'css', 'json',
        'yaml', 'markdown', 'lua', 'sh', 'python', "graphql"
    },
    settings = {
        languages = {
            typescript = {prettier, eslint},
            javascript = {prettier, eslint},
            typescriptreact = {prettier, eslint},
            javascriptreact = {prettier, eslint},
            vue = {prettier, eslint},
            html = {prettier},
            css = {prettier},
            json = {prettier},
            yaml = {prettier},
            markdown = {prettier},
            lua = {luaFormat},
            sh = {shellcheck, shfmt},
            python = {flake8},
            graphql = {prettier}
        }
    }
}

