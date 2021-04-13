-- BarBar Setup

local opts = {noremap = true, silent = true}

-- Move between buffers
vim.api.nvim_set_keymap('n', '<TAB>', ':BufferNext<CR>', opts)
vim.api.nvim_set_keymap('n', '<S-TAB>', ':BufferPrevious<CR>', opts)

-- Re-order
vim.api.nvim_set_keymap('n', '<M-.>', ':BufferMoveNext<CR>', opts)
vim.api.nvim_set_keymap('n', '<M-,>', ':BufferMovePrevious<CR>', opts)

-- Close
vim.api.nvim_set_keymap('n', '<M-c>', ':BufferClose<CR>', opts)
