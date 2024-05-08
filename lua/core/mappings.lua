-- General Mappings

-- Save
vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true, desc = 'Save File' })
vim.keymap.set('i', '<C-s>', '<ESC>:w<CR>', { noremap = true, silent = true, desc = 'Normal Mode & Save File' })

-- Quit
vim.keymap.set('n', '<C-q>', ':q<CR>', { noremap = true, silent = true, desc = 'Quit' })
vim.keymap.set('n', '<C-Q>', ':qall!<CR>', { noremap = true, silent = true, desc = 'Force Quit' })

-- Better Tabbing
vim.keymap.set('v', '<S-TAB>', '<gv', { noremap = true, silent = true, desc = 'Next Buffer' })
vim.keymap.set('v', '<TAB>', '>gv', { noremap = true, silent = true, desc = 'Prev. Buffer' })

-- Window Nav
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true, desc = '' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true, desc = '' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true, desc = '' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true, desc = '' })

-- Terminal
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>', { noremap = true, silent = true, desc = '' })
vim.keymap.set('t', '<A-h>', '<C-\\><C-N><C-w>h', { noremap = true, silent = true, desc = '' })
vim.keymap.set('t', '<A-j>', '<C-\\><C-N><C-w>j', { noremap = true, silent = true, desc = '' })
vim.keymap.set('t', '<A-k>', '<C-\\><C-N><C-w>k', { noremap = true, silent = true, desc = '' })
vim.keymap.set('t', '<A-l>', '<C-\\><C-N><C-w>l', { noremap = true, silent = true, desc = '' })

-- Move Line/Block
vim.keymap.set('n', '<A-j>', ':MoveLine(1)<CR>', { noremap = true, silent = true, desc = 'Line Down' })
vim.keymap.set('n', '<A-k>', ':MoveLine(-1)<CR>', { noremap = true, silent = true, desc = 'Line Up' })
vim.keymap.set('v', '<A-j>', ':MoveBlock(1)<CR>', { noremap = true, silent = true, desc = 'Block Down' })
vim.keymap.set('v', '<A-k>', ':MoveBlock(-1)<CR>', { noremap = true, silent = true, desc = 'Block Up' })

vim.keymap.set('n', '<A-h>', ':MoveHChar(-1)<CR>', { noremap = true, silent = true, desc = 'Move Char Left' })
vim.keymap.set('n', '<A-l>', ':MoveHChar(1)<CR>', { noremap = true, silent = true, desc = 'Move Char Right' })
vim.keymap.set('v', '<A-l>', ':MoveHBlock(1)<CR>', { noremap = true, silent = true, desc = 'Move Block Left' })
vim.keymap.set('v', '<A-h>', ':MoveHBlock(-1)<CR>', { noremap = true, silent = true, desc = 'Move Block Right' })

vim.keymap.set('n', '<leader>wf', ':MoveWord(1)<CR>', { noremap = true, silent = true, desc = 'Transpose Word Right' })
vim.keymap.set('n', '<leader>wb', ':MoveWord(-1)<CR>', { noremap = true, silent = true, desc = 'Transpose Word Left' })
