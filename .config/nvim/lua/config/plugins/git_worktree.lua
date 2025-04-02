return {
    {
        'polarmutex/git-worktree.nvim',
        version = '^2',
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local config = require('git-worktree.config')
            local Hooks = require("git-worktree.hooks")
            local update_on_switch = Hooks.builtins.update_current_buffer_on_switch

            Hooks.register(Hooks.type.SWITCH, function(path, prev_path)
                vim.notify("Moved from " .. prev_path .. " to " .. path)
                update_on_switch(path, prev_path)
            end)

            Hooks.register(Hooks.type.DELETE, function(path)
                vim.notify("Try to delete branch" .. path)
                vim.cmd(config.update_on_change_command)
            end)

            require("telescope").setup({
                extensions = {
                    git_worktree = {
                        mappings = {
                            delete_worktree = "<A-d>", -- Nouvelle touche : Alt+d
                            -- delete_worktree = "<leader>d",  -- Alternative avec leader
                        },
                    },
                },
            })

            require('telescope').load_extension('git_worktree')
            vim.keymap.set('n', "<BS>c",
                "<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>")
            vim.keymap.set('n', "<BS>s",
                "<CMD>lua require('telescope').extensions.git_worktree.git_worktree()<CR>")
            -- vim.keymap.set('n', "<BS>s", require('telescope.builtin').help_tags)
        end

    }
}
