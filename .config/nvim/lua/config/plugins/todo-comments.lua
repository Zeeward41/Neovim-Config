return {
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        config = function()
            local todo_comments = require("todo-comments")

            -- set keymaps
            local keymap = vim.keymap -- for conciseness

            keymap.set("n", "<leader>l", function()
                todo_comments.jump_next()
            end, { desc = "Next todo comment" })

            keymap.set("n", "<leader>k", function()
                todo_comments.jump_prev()
            end, { desc = "Previous todo comment" })

            todo_comments.setup()
        end,
    }
}
