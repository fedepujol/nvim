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
vim.api.nvim_set_keymap('i', 'hh', '<ESC><CR>', opts)

-- Better Tabbing
vim.api.nvim_set_keymap('v', '<S-TAB>', '<gv', opts)
vim.api.nvim_set_keymap('v', '<TAB>', '>gv', opts)

-- Window Nav
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', opts)
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', opts)
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', opts)
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', opts)

-- Move cursor line up or down
vim.api.nvim_set_keymap('n', '<C-M-k>', ':normal! dd2kp<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-M-j>', ':normal! ddp<CR>', opts)

-- Split Terminal Below
vim.api.nvim_command('ca terminal bo terminal')

-- Terminal
vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-n>', { noremap = true })
vim.api.nvim_set_keymap('t', '<A-h>', '<C-\\><C-N><C-w>h', { noremap = true})
vim.api.nvim_set_keymap('t', '<A-j>', '<C-\\><C-N><C-w>j', { noremap = true})
vim.api.nvim_set_keymap('t', '<A-k>', '<C-\\><C-N><C-w>k', { noremap = true})
vim.api.nvim_set_keymap('t', '<A-l>', '<C-\\><C-N><C-w>l', { noremap = true})
vim.api.nvim_set_keymap('i', '<A-h>', '<C-\\><C-N><C-w>h', { noremap = true})
vim.api.nvim_set_keymap('i', '<A-j>', '<C-\\><C-N><C-w>j', { noremap = true})
vim.api.nvim_set_keymap('i', '<A-k>', '<C-\\><C-N><C-w>k', { noremap = true})
vim.api.nvim_set_keymap('i', '<A-l>', '<C-\\><C-N><C-w>l', { noremap = true})
vim.api.nvim_set_keymap('n', '<A-h>', '<C-w>h', { noremap = true})
vim.api.nvim_set_keymap('n', '<A-j>', '<C-w>j', { noremap = true})
vim.api.nvim_set_keymap('n', '<A-k>', '<C-w>k', { noremap = true})
vim.api.nvim_set_keymap('n', '<A-l>', '<C-w>l', { noremap = true})
