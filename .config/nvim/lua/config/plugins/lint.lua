return {
    {
        'mfussenegger/nvim-lint',
        -- event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lint = require('lint')
            lint.linters_by_ft = {
                javascript = { 'eslint' },
                javascriptreact = { 'eslint' },
                -- css = { 'stylelint' },
                python = { 'ruff' },
                -- lua = { 'luacheck' },
            }

            -- Configurer les linters personnalisés (si nécessaire)
            --[[ lint.linters.eslint = {
                cmd = "npx",
                args = { "eslint", "--format", "json", "--stdin", "--stdin-filename", '$FILENAME' },
                -- args = { "eslint", "--format", "json", "--stdin", "--stdin-filename", "./eslint.config.js" },
                stdin = true,
                stream = "both",
                ignore_exitcode = true,
                parser = function(output)
                    vim.notify('parser test', vim.log.levels.WARN)
                    local success, decoded = pcall(vim.json.decode, output)
                    if not success then
                        print("Erreur de décodage JSON :", output)
                        return {}
                    end

                    local diagnostics = {}

                    for _, fileReport in ipairs(decoded) do
                        for _, message in ipairs(fileReport.messages) do
                            table.insert(diagnostics, {
                                lnum = message.line - 1,  -- Neovim utilise des index basés sur 0
                                end_lnum = message.endLine and (message.endLine - 1) or nil,
                                col = message.column - 1, -- Même chose pour les colonnes
                                end_col = message.endColumn and (message.endColumn - 1) or nil,
                                severity = message.severity == 2 and vim.diagnostic.severity.ERROR or
                                    vim.diagnostic.severity.WARN,
                                message = message.message,
                                source = "eslint",
                                code = message.ruleId,
                            })
                        end
                    end

                    return diagnostics
                end
            } ]]

            vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "TextChanged" }, {
                callback = function()
                    lint.try_lint()
                end
            })
            -- test
            vim.keymap.set('n', '<leader>x', function()
                lint.try_lint("eslint")
                vim.notify("Linting...", vim.log.levels.INFO)
            end, { desc = "Lint the current Buffer"}
            )
        end
    }
}
