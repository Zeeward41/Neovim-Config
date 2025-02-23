-- function to unable lsp tsl_ls diagnostics if eslint (js...) is found
-- Vérifier si un fichier de configuration ESLint est présent
local function has_eslint_config()
    local eslint_config_files = {
        ".eslintrc",
        ".eslintrc.js",
        ".eslintrc.cjs",
        ".eslintrc.yaml",
        ".eslintrc.yml",
        ".eslintrc.json",
        "eslint.config.js", -- Nouveau format ESLint Flat Config
        "eslint.config.mjs",
        "eslint.config.cjs"
    }

    for _, file in ipairs(eslint_config_files) do
        if vim.fn.findfile(file, ".;") ~= "" then
            return true
        end
    end
    return false
end

-- Autocommand pour désactiver les diagnostics du LSP si ESLint est présent
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
    callback = function()
        if has_eslint_config() then
            -- Désactiver les diagnostics du LSP si ESLint est présent
            vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
        else
            -- Réactiver les diagnostics du LSP si ESLint est absent
            vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics, {
                    virtual_text = true,
                    signs = true,
                    underline = true,
                    update_in_insert = false,
                }
            )
        end
    end,
})
