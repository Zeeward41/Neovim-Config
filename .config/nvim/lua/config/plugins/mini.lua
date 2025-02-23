return {
  {
    'echasmovski/mini.nvim',
    enabled = false,
    config = function()
        local statusline = require('mini.statusline')

        -- Configuration de `mini.statusline`
        statusline.setup({
            use_icons = true, -- Active les icônes dans la statusline
        })
    end
  },
}
