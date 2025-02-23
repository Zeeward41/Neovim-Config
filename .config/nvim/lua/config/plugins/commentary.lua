return {
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        config = function()
            require('Comment').setup({
                toggler = {
                    ---Line-comment toggle keymap
                    line = '<BS><up>',
                    ---Block-comment toggle keymap
                    block = '<BS><down>',
                },
                ---LHS of operator-pending mappings in NORMAL and VISUAL mode
                opleader = {
                    ---Line-comment keymap
                    line = '<leader><left>',
                    ---Block-comment keymap
                    block = '<leader><right>',
                },
            })
        end
    }
}
