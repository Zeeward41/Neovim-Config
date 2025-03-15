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
                root_dir = require("lspconfig.util").root_pattern("requirements.txt", "setup.py", ".git"),
                filetypes = { 'py' },
                settings = {
                    python = {
                        analysis = {
                            diagnosticMode = "off"
                        }
                    }
                }
            }
            require("lspconfig").ts_ls.setup {
                capabilities = capabilities,
                root_dir = require("lspconfig.util").root_pattern("tsconfig.json", "eslint.config.js", "package.json", ".git"),
            }
            require("lspconfig").terraformls.setup {
                capabilities = capabilities,
                root_dir = require("lspconfig.util").root_pattern(".terraform", ".git"),
            }
            require("lspconfig").gopls.setup {
                capabilities = capabilities,
                root_dir = require("lspconfig.util").root_pattern("go.mod", ".git"),
                cmd = { "gopls" },
                settings = {
                    gopls = {
                        codelenses = {
                            generate = true,       -- Activer les code lenses pour la génération de code
                            gc_details = true,     -- Afficher les détails du garbage collector
                        },
                        usePlaceholders = true,    -- Utiliser des placeholders pour les paramètres de fonction
                        completeUnimported = true, -- Compléter les symboles non importés
                    },
                },
            }
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
                root_dir = require("lspconfig.util").root_pattern("package.json", ".git"),
                cmd = { "vscode-html-language-server", "--stdio" },
                filetypes = { "html" },
            }
            require("lspconfig").stylelint_lsp.setup {
                capabilities = capabilities,
                root_dir = require("lspconfig.util").root_pattern("package.json", ".git"),
                cmd = { "stylelint-lsp", "--stdio" },
                filetypes = { "css", "scss", "less", "sass", "postcss" }, -- Types de fichiers pris en charge
            }
        end,
    }
}
