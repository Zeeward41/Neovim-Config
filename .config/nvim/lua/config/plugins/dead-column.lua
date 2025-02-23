return {
    {
        'Bekaboo/deadcolumn.nvim',
        config = function()
            require('deadcolumn').setup({
                scope = 'line',
                blending = {
                    threshold = 0.7,
                    colorcode = '#27d796',
                    -- comme j'utilise un background horizon qui semble avoir
                    -- un transparent background, le blending ne marche pas
                    -- donc avec cette config blanc et rouge .
                },
                warning = {
                    alpha = 1,
                    offset = 0,
                    colorcode = '#e95678',
                },
            })
        end
    }
}
