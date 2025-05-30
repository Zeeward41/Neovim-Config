return {
    {
        'mfussenegger/nvim-lint',
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lint = require('lint')
            lint.linters_by_ft = {
                javascript = { 'eslint' },
                javascriptreact = { 'eslint' },
                typescript = { 'eslint' },
                typescriptreact = { 'eslint' },
                css = { 'stylelint' },
                python = { 'ruff' },
                go = { 'golangcilint' },
                -- lua = { 'luacheck' },
            }

            -- lint.linters["golangcilint"].args = {
            --     "run", "--out-format=json"
            -- }

            local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

            vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "TextChanged" }, {
                group = lint_augroup,
                callback = function()
                    lint.try_lint()
                end
            })
            -- test
            vim.keymap.set('n', '<leader>x', function()
                lint.try_lint()
                vim.notify("Linting...", vim.log.levels.INFO)
            end, { desc = "Lint the current Buffer" }
            )
        end
    }
}
