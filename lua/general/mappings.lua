-- General Mappings
local opts = { noremap = true }

-- Use ALT + hjkl to resize windows
vim.api.nvim_set_keymap('n', '<M-j>', ':resize -2<CR>', opts)
vim.api.nvim_set_keymap('n', '<M-k>', ':resize +2<CR>', opts)
vim.api.nvim_set_keymap('n', '<M-h>', ':vertical resize -2<CR>', opts)
vim.api.nvim_set_keymap('n', '<M-l>', ':vertical resize +2<CR>', opts)

-- Save
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', opts)
vim.api.nvim_set_keymap('i', '<C-s>', '<ESC>:w<CR>', opts)

-- Quit
vim.api.nvim_set_keymap('n', '<C-q>', ':q<CR>', opts)
vim.api.nvim_set_keymap('i', 'jk', '<ESC><CR>', opts)

-- Better Tabbing
vim.api.nvim_set_keymap('v', '<S-TAB>', '<gv', opts)
vim.api.nvim_set_keymap('v', '<TAB>', '>gv', opts)

-- Window Nav
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', opts)
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', opts)
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', opts)
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', opts)

-- Split Help vertical
vim.api.nvim_command("ca h vert h")

-- Move cursor line up or down
vim.api.nvim_set_keymap('n', '<C-M-k>', ':normal! dd2kp<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-M-j>', ':normal! ddp<CR>', opts)
