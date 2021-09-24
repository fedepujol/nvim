-- General Mappings
local opts = { noremap = true }

-- Save
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', opts)
vim.api.nvim_set_keymap('i', '<C-s>', '<ESC>:w<CR>', opts)

-- Quit
vim.api.nvim_set_keymap('n', '<C-q>', ':q<CR>', opts)

-- Better Tabbing
vim.api.nvim_set_keymap('v', '<S-TAB>', '<gv', opts)
vim.api.nvim_set_keymap('v', '<TAB>', '>gv', opts)

-- Window Nav
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', opts)
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', opts)
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', opts)
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', opts)

-- Terminal
vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-n>', { noremap = true })
vim.api.nvim_set_keymap('t', '<A-h>', '<C-\\><C-N><C-w>h', { noremap = true})
vim.api.nvim_set_keymap('t', '<A-j>', '<C-\\><C-N><C-w>j', { noremap = true})
vim.api.nvim_set_keymap('t', '<A-k>', '<C-\\><C-N><C-w>k', { noremap = true})
vim.api.nvim_set_keymap('t', '<A-l>', '<C-\\><C-N><C-w>l', { noremap = true})

-- Move Line/Block
vim.api.nvim_set_keymap('n', '<C-A-j>', ":MoveLine(1)<CR>", { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n', '<C-A-k>', ":MoveLine(-1)<CR>", { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('v', '<C-A-j>', ":MoveBlock(1)<CR>", { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('v', '<C-A-k>', ":MoveBlock(-1)<CR>", { noremap = true, silent = true, nowait = true })
