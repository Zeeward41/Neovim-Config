return {
    {
        'rcarriga/nvim-notify',
        config = function()
            require("notify").setup({
                timeout = 3000,
            })
        end
    }
}
