return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim", 'nvim-telescope/telescope.nvim' },
        config = function()
            local harpoon = require("harpoon")

            -- REQUIRED
            harpoon:setup()
            -- REQUIRED

            vim.keymap.set("n", "<leader>r", function() harpoon:list():add() end, { desc = "Add file to Harpoon list" })
            vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
                { desc = "Show Harpoon list" })

            vim.keymap.set("n", "<leader>&", function() harpoon:list():select(1) end,
                { noremap = true, desc = "Select item 1 in Harpoon list" })
            vim.keymap.set("n", "<leader>é", function() harpoon:list():select(2) end,
                { noremap = true, desc = "Select item 2 in Harpoon list" })
            vim.keymap.set("n", '<leader>"', function() harpoon:list():select(3) end,
                { desc = "Select item 3 in Harpoon list" })
            vim.keymap.set("n", "<leader>'", function() harpoon:list():select(4) end,
                { desc = "Select item 4 in Harpoon list" })
            vim.keymap.set("n", "<leader>(", function() harpoon:list():select(5) end,
                { desc = "Select item 5 in Harpoon list" })
            vim.keymap.set("n", "<BS>-", function() harpoon:list():select(6) end,
                { desc = "Select item 6 in Harpoon list" })
            vim.keymap.set("n", "<BS>è", function() harpoon:list():select(7) end,
                { desc = "Select item 7 in Harpoon list" })
            vim.keymap.set("n", "<BS>_", function() harpoon:list():select(8) end,
                { desc = "Select item 8 in Harpoon list" })
            vim.keymap.set("n", "<BS>ç", function() harpoon:list():select(9) end,
                { desc = "Select item 9 in Harpoon list" })

            -- Toggle previous & next buffers stored within Harpoon list
            vim.keymap.set("n", "<leader>a", function() harpoon:list():prev() end,
                { desc = "Select previous item in Harpoon list" })
            vim.keymap.set("n", "<leader>z", function() harpoon:list():next() end,
                { desc = "Select next item in Harpoon list" })
            -- ##################################################
            -- Telescope
            -- basic telescope configuration
            local conf = require("telescope.config").values
            local function toggle_telescope(harpoon_files)
                local file_paths = {}
                for _, item in ipairs(harpoon_files.items) do
                    table.insert(file_paths, item.value)
                end

                require("telescope.pickers").new({}, {
                    prompt_title = "Harpoon",
                    finder = require("telescope.finders").new_table({
                        results = file_paths,
                    }),
                    previewer = conf.file_previewer({}),
                    sorter = conf.generic_sorter({}),
                }):find()
            end

            vim.keymap.set("n", "<leader>t", function() toggle_telescope(harpoon:list()) end,
                { desc = "Open harpoon window" })
        end
    }
}
