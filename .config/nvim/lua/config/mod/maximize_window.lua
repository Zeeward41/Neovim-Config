-- Fonction pour basculer entre agrandir et réduire une fenêtre
local function toggle_maximize_window()
    local current_win = vim.api.nvim_get_current_win()
    local current_buf = vim.api.nvim_win_get_buf(current_win)

    -- Vérifier si la fenêtre est déjà maximisée
    if vim.w.is_maximized then
        -- Restaurer la taille précédente
        vim.api.nvim_win_set_width(current_win, vim.w.prev_width)
        vim.api.nvim_win_set_height(current_win, vim.w.prev_height)
        vim.w.is_maximized = false
    else
        -- Sauvegarder la taille actuelle
        vim.w.prev_width = vim.api.nvim_win_get_width(current_win)
        vim.w.prev_height = vim.api.nvim_win_get_height(current_win)
        -- Maximiser la fenêtre
        vim.api.nvim_win_set_width(current_win, vim.o.columns)
        vim.api.nvim_win_set_height(current_win, vim.o.lines)
        vim.w.is_maximized = true
    end
end

-- Mapping de la touche (par exemple, <Leader>m)
vim.api.nvim_set_keymap('n', '<A-m>', '', {
    noremap = true,
    silent = true,
    callback = toggle_maximize_window,
    desc = "Toggle panel full screen",
})
