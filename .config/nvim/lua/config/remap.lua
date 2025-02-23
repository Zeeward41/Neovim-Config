vim.g.mapleader = " "
vim.keymap.set("n", "<leader>q", vim.cmd.Oil, { desc = "Display folder tree structure" })
vim.keymap.set('n', "<leader>j", vim.cmd.TodoTelescope, { desc = "Telescope to search for TODO items" })
--

-- Move highlighted lines up or down.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move highlighted block down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move highlighted block up" })


-- Switch to another project
vim.keymap.set("n", "<BS>o", "<cmd> !tmux neww '$HOME/.config/script/tmux-sessionizer'<CR>",
    { desc = 'Launch tmux-sessionizer' })
vim.keymap.set("n", "<BS>i", "<cmd> !tmux neww '$HOME/.config/script/tmux-session'<CR>",
    { desc = 'Launch tmux-session' })

-- Format buffer using LSP
--vim.keymap.set("n", "<leader>d", vim.lsp.buf.format)

-- Format
--[[ vim.keymap.set("n", "<leader>w", 'gg=G', { desc = 'formattage'}) ]]

-- Replace word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Replace word under cursor (all Buffer)" })

-- Reload configuration
vim.keymap.set("n", "<BS>;", function()
    vim.cmd("so")
    -- vim.cmd("source $MYVIMRC<CR>")
    vim.notify("Reload Configuration", vim.log.levels.INFO)
end, { desc = "Reload configuration" })


vim.keymap.set({ "n", "v" }, "<leader>y", [["+yy]], { desc = "Copy to clipboard" })

-- Navigate between windows
--vim.keymap.set("n", "<leader>p", "<C-w>w", { desc = "Switch to next window" })
vim.api.nvim_set_keymap('n', '<A-h>', '<C-w>h', { noremap = true, silent = true, desc = "Move to right panel" })
vim.api.nvim_set_keymap('n', '<A-j>', '<C-w>j', { noremap = true, silent = true, desc = "Move to bottom panel" })
vim.api.nvim_set_keymap('n', '<A-k>', '<C-w>k', { noremap = true, silent = true, desc = "Move to top panel" })
vim.api.nvim_set_keymap('n', '<A-l>', '<C-w>l', { noremap = true, silent = true, desc = "Move to left panel" })
