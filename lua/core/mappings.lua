-- General Mappings
--
-- Save
vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true, desc = '[s]ave File' })
vim.keymap.set(
	'i',
	'<C-s>',
	'<ESC>:w<CR>',
	{ noremap = true, silent = true, desc = 'Normal Mode & Save File' }
)

-- Quit
vim.keymap.set('n', '<C-q>', ':q<CR>', { noremap = true, silent = true, desc = '[q]uit' })
vim.keymap.set(
	'n',
	'<C-Q>',
	':qall!<CR>',
	{ noremap = true, silent = true, desc = 'Force [Q]uit all' }
)

-- Window Nav
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true, desc = '' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true, desc = '' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true, desc = '' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true, desc = '' })

-- Resize Splits
vim.keymap.set(
	'n',
	'<M-.>',
	'<C-W>5<',
	{ noremap = true, silent = true, desc = 'Vertical Split 5<' }
)
vim.keymap.set(
	'n',
	'<M-,>',
	'<C-W>5>',
	{ noremap = true, silent = true, desc = 'Vertical Split 5>' }
)

vim.keymap.set(
	'n',
	'<M-t>',
	'<C-W>+',
	{ noremap = true, silent = true, desc = 'Horizontal Split +' }
)
vim.keymap.set(
	'n',
	'<M-s>',
	'<C-W>-',
	{ noremap = true, silent = true, desc = 'Horizontal Split -' }
)

-- Terminal
vim.keymap.set(
	't',
	'<ESC>',
	'<C-\\><C-n>',
	{ noremap = true, silent = true, desc = 'Exit terminal mode' }
)
vim.keymap.set('t', '<A-h>', '<C-\\><C-N><C-w>h', { noremap = true, silent = true, desc = '' })
vim.keymap.set('t', '<A-j>', '<C-\\><C-N><C-w>j', { noremap = true, silent = true, desc = '' })
vim.keymap.set('t', '<A-k>', '<C-\\><C-N><C-w>k', { noremap = true, silent = true, desc = '' })
vim.keymap.set('t', '<A-l>', '<C-\\><C-N><C-w>l', { noremap = true, silent = true, desc = '' })

-- Notes
vim.keymap.set('n', '<leader>nni', function()
	require('common-utils').generate_uuid()
end, { desc = '[n]otes [n]ew [i]d' })
