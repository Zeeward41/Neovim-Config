return {
    {
        "m4xshen/hardtime.nvim",
        dependencies = { "MunifTanjim/nui.nvim", "folke/noice.nvim" },
        opts = {},
        config = function()
            require("hardtime").setup({
                notification = true,
                custom_notification = function(message)
                    require("noice")(message, "warn")
                end
                })
        end,
    }
}
