return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            "folke/lazydev.nvim",
            ft = "lua",
            opts = {
                library = {
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                }
            }
        },
        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            require("lspconfig").lua_ls.setup { capabilities = capabilities }
            require("lspconfig").pyright.setup {
                capabilities = capabilities,
                filetypes = { 'py' },
                settings = {
                    python = {
                        analysis = {
                            diagnosticMode = "off"
                        }
                    }
                }
            }
            require("lspconfig").ts_ls.setup { capabilities = capabilities }
            require("lspconfig").terraformls.setup { capabilities = capabilities }
            require("lspconfig").jsonls.setup {
                cmd = { "vscode-json-languageserver", "--stdio" },
                filetypes = { "json", "jsonc" },
                capabilities = capabilities,
                settings = {
                    json = {
                        schemas = require('schemastore').json.schemas(),
                        validate = { enable = true },
                    }
                }
            }
            require("lspconfig").yamlls.setup {
                capabilities = capabilities,
                cmd = { "yaml-language-server", "--stdio" },
                filetypes = { "yaml", "yml" },
            }

            require("lspconfig").html.setup {
                capabilities = capabilities,
                cmd = { "vscode-html-language-server", "--stdio" },
                filetypes = { "html" },
                --[[ init_options = {
                    configurationSection = { "html", "css", "javascript" },
                    embeddedLanguages = {
                        css = true,
                        javascript = true
                    }
                }, ]]
                --[[ settings = {
                    html = {
                        format = {
                            enable = true
                        },
                        validate = {
                            scripts = true,
                            styles = true
                        },
                        suggest = {
                            html5 = true
                        }
                    }
                } ]]
            }
            require("lspconfig").stylelint_lsp.setup {
                capabilities = capabilities,
                filetypes = { "css", "scss", "less", "sass", "postcss" }, -- Types de fichiers pris en charge
                --[[ settings = {
                    stylelintplus = {
                        autoFixOnSave = true,                                -- Corrige automatiquement les erreurs lors de l'enregistrement
                        validateOnSave = true,                               -- Valide les fichiers lors de l'enregistrement
                        configFile = vim.fn.expand("~/stylelint.config.js"), -- Spécifie un fichier de config
                    },
                }, ]]
                --[[ cmd = { "vscode-css-language-server", "--stdio" },
                filetypes = { "css", "scss", "less" },
                settings = {
                    css = { validate = true },
                    scss = { validate = true },
                    less = { validate = true }
                } ]]
            }
        end,
    }
}
