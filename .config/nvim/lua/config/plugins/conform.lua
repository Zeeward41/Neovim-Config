return {
    "stevearc/conform.nvim",
    opts = {},
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require('conform').setup({
            formatters_by_ft = {
                css = { "prettier" },
                graphql = { "prettier" },
                json = { "prettier" },
                html = { "prettier" },
                lua = { "stylua" },
                markdown = { "prettier" },
                python = { "isort", "black" },
                javascript = { "prettier" },
                javascriptreact = { "prettier" },
                typescript = { "prettier" },
                typescriptreact = { "prettier" },
                yaml = { "prettier" },
                hcl = { "hcl" }
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback",
            }
        })

        vim.keymap.set({ "n", "v" }, "<leader>w", function()
            require('conform').format({
                timeout_ms = 500,
                lsp_format = "fallback"
            }
            )
            vim.notify("Format Buffer", vim.log.levels.INFO)
        end, { desc = "Format file or range (in visual mode)" })
    end,
}
