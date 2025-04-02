local M = {}

function M.get_project_paths()
    -- Get current file absolute path
    local current_file = vim.api.nvim_buf_get_name(0)
    if current_file == "" then return nil end -- empty buffer

    -- Define possible base paths
    local base_paths = {
        personal = vim.fn.expand("$HOME/Documents/personal"),
        work = vim.fn.expand("$HOME/Documents/work")
    }

    -- Find which base the file belongs to
    for _, base_path in pairs(base_paths) do
        -- Check if file path contains the base path
        if string.find(current_file, base_path, 1, true) then
            -- Get project Name and Relative Path
            local relative_path = string.sub(current_file, #base_path + 2)
            local project_name = string.match(relative_path, "^([^/]+)")

            if project_name then
                return {
                    project_name = project_name,                    -- ex: Zeeurl
                    relative_path = relative_path,                  -- Zeeurl/frontend/src/App.jsx
                    root_project = base_path .. "/" .. project_name -- $HOME/Documents/personal/Zeeurl
                }
            end
        end
    end

    return nil -- No match found
end

function M.root_config_folder(paths_infos, root_files)
    -- Utilisation dans votre configuration LSP
    if paths_infos then
        -- Ici vous pouvez passer project_root à votre LSP
        local paths = vim.fs.find(root_files,
            {
                path = vim.fs.dirname(vim.api.nvim_buf_get_name(0)),
                upward = true,
                stop = paths_infos.root_project
            })
        local root_folder = vim.fs.dirname(paths[1])

        return root_folder
    else
        vim.notify(string.format("No %s file config detected !!", vim.bo.filetype), vim.log.levels.WARN)
        return nil
    end
end

-- function M.config_root_lsp(root_folder)
--     local lsp_config = require('lspconfig')
--     lsp_config.ts_ls.setup({
--         root_dir = function()
--             return root_folder
--         end
--     })
-- end

function M.config_root_lint(root_folder)
    local lint = require('lint')
    local filetype = vim.bo.filetype                  -- get filetype open buffer
    local linter_names = lint.linters_by_ft[filetype] -- get linter_names for this filetype
    lint.linters[linter_names[1]].cwd = root_folder
    vim.notify("Linter Detected", vim.log.levels.INFO)
end

return M
