return {
    {
        'Mr-LLLLL/interestingwords.nvim',
        config = function()
            require("interestingwords").setup {
                color_key = "<BS>j",
                search_key = "<BS>k",
            }
        end

    }
}
