-- load globals variables
local globals = require('config.globals')
local k8s_version = globals.kubernetes.version

return {
    {
        "someone-stole-my-name/yaml-companion.nvim",
        dependencies = {
            { "neovim/nvim-lspconfig" },
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope.nvim" },
        },
        config = function()
            require("telescope").load_extension("yaml_schema")
            local cfg = require('yaml-companion').setup {
                -- Disable default schemas
                builtin_schemas = false,
                -- Additional schemas available in Telescope picker
                schemas = {
                    {
                        name = "GitHub Actions Workflow",
                        uri = "https://raw.githubusercontent.com/SchemaStore/schemastore/master/src/schemas/json/github-workflow.json",
                        file_match = { "/.github/workflows/*.yml", "/.github/workflows/*.yaml" },
                    },
                    {
                        name = "kubernetes-Deployment",
                        uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/" .. k8s_version .. "-standalone-strict/deployment.json",
                    },
                    {
                        name = "kubernetes-Replicaset",
                        uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/" .. k8s_version .. "-standalone-strict/replicaset.json",
                    },
                    {
                        name = "kubernetes-Pod",
                        uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/" .. k8s_version .. "-standalone-strict/pod.json",
                    },
                    {
                        name = "kubernetes-Service",
                        uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/" .. k8s_version .. "-standalone-strict/service.json",
                    },
                    {
                        name = "kubernetes-Configmap",
                        uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/" .. k8s_version .. "-standalone-strict/configmap.json",
                    },
                    {
                        name = "kubernetes-Secret",
                        uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/" .. k8s_version .. "-standalone-strict/secret.json",
                    },
                    {
                        name = "kubernetes-Statefulset",
                        uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/" .. k8s_version .. "-standalone-strict/statefulset.json",
                    },
                    {
                        name = "kubernetes-Daemonset",
                        uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/" .. k8s_version .. "-standalone-strict/daemonset.json",
                    },
                    {
                        name = "kubernetes-Cronjob",
                        uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/" .. k8s_version .. "-standalone-strict/cronjob.json",
                    },
                    {
                        name = "kubernetes-Ingress",
                        uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/" .. k8s_version .. "-standalone-strict/ingress.json",
                    },
                    {
                        name = "kubernetes-PersistentVolume",
                        uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/" .. k8s_version .. "-standalone-strict/persistentvolume.json",
                    },
                    {
                        name = "kubernetes-PersistentVolumeClaim",
                        uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/" .. k8s_version .. "-standalone-strict/persistentvolumeclaim.json",
                    },
                    {
                        name = "kubernetes-Namespace",
                        uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/" .. k8s_version .. "-standalone-strict/namespace.json",
                    },
                    {
                        name = "kubernetes-Replicaset",
                        uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/" .. k8s_version .. "-standalone-strict/replicaset.json",
                    },
                    {
                        name = "kubernetes-NetworkPolicy",
                        uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/" .. k8s_version .. "-standalone-strict/networkpolicy.json",
                    },
                    {
                        name = "kubernetes-ServiceAccount",
                        uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/" .. k8s_version .. "-standalone-strict/serviceaccount.json",
                    },
                    {
                        name = "kubernetes-ClusterRole",
                        uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/" .. k8s_version .. "-standalone-strict/clusterrole.json",
                    },
                    {
                        name = "kubernetes-ClusterRoleBinding",
                        uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/" .. k8s_version .. "-standalone-strict/clusterrolebinding.json",
                    },
                    {
                        name = "kubernetes-Role",
                        uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/" .. k8s_version .. "-standalone-strict/role.json",
                    },
                    {
                        name = "kubernetes-RoleBinding",
                        uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/" .. k8s_version .. "-standalone-strict/rolebinding.json",
                    }
                },
                lspconfig = {
                    settings = {
                        redhat = { telemetry = { enabled = false } },
                        yaml = {
                            schemaStore = {
                                enable = false,
                                url = "",
                            },
                            schemaDownload = { enable = false },
                            -- schemas = {},
                        }
                    }
                }
            }

            require("lspconfig")["yamlls"].setup(cfg)

            -- Add keybinding to replace :Telescope yaml-schema
            vim.keymap.set('n', '<BS>m', '<cmd>Telescope yaml_schema<CR>', {
                noremap = true,
                silent = true,
                desc = "YAML: Select schema"
            })
        end,
    }
}
