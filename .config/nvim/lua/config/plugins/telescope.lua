return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
        },
        config = function()
            require('telescope').setup {
                extensions = {
                    fsf = {}
                }
            }

            require('telescope').load_extension('fzf')

            vim.keymap.set('n', "<leader>h", require('telescope.builtin').help_tags)
            vim.keymap.set('n', "<leader>g", require('telescope.builtin').git_files)
            vim.keymap.set('n', "<leader>b", require('telescope.builtin').buffers)
            vim.keymap.set('n', "<leader>v", require('telescope.builtin').live_grep)
            vim.keymap.set('n', "<leader>f", require('telescope.builtin').find_files)
            vim.keymap.set('n', "<leader>c", function()
                require('telescope.builtin').find_files {
                    cwd = vim.fn.stdpath("config")
                }
            end)
            -- vim.keymap.set('n', "<leader>v", function()
            --     require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") })
            -- end)
        end,
    }
}
