return {
    {
        'saghen/blink.cmp',
        -- optional: provides snippets for the snippet source
        dependencies = 'rafamadriz/friendly-snippets',

        -- use a release tag to download pre-built binaries
        version = '*',

        opts = {
            keymap = {
                preset = 'default',
                ['<Tab>'] = { 'select_and_accept', 'fallback' }
            },

            appearance = {
                use_nvim_cmp_as_default = true,
                -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- Adjusts spacing to ensure icons are aligned
                nerd_font_variant = 'mono',

            },
            completion = {
                -- accept = { auto_brackets = { enabled = false }, },
                -- Show documentation when selecting a completion item
                documentation = { auto_show = true, auto_show_delay_ms = 500 },

                -- Ajoutez cette ligne pour configurer le menu de complétion avec treesitter
                menu = {
                    draw = {
                        treesitter = { 'lsp' },
                    }
                }

                -- Display a preview of the selected item on the current line
                -- ghost_text = { enabled = true },
            },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },
        },
        opts_extend = { "sources.default" }
    }
}
