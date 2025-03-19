return {
    {
        'akinsho/horizon.nvim',
        enabled = false,
        config = function()
            vim.cmd.colorscheme('horizon')
            vim.o.background = "dark"
        end
    }
}
