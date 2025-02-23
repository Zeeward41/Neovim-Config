return {
    {
        'mbbill/undotree',
        config = function()
            vim.keymap.set('n', '<BS>d', vim.cmd.UndotreeToggle)
        end
    }
}
