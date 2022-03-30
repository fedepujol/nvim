-- BarBar Setup
vim.g.bufferline = {
	animation = false, -- Enable animations
	auto_hide = false, -- Enable autohidding the bar when there is a single buffer
	clickable = true, -- Enables clickable tabs. (Left-click goto buffer, middle-click closes)
	closable = true, -- Enables close button
	icon_separator_active = '|', -- Separator icon for active tabs
	icon_separator_inactive = '|', -- Separator icon for inactive tabs
	icons = true, -- Enable icons
	insert_at_end = false, -- Enables open new buffer at the end (Defaults to false -> open after current)
	insert_at_start = false, -- Enables open new buffer at the start. Has priority over insert_at_end. (Defualts to false -> open after current)
	maximum_length = 20, -- Maximum buffer name length
	no_name_title = 'Undefined', -- Sets the name of unnamed buffers. Only a static string is valid.
	tabpages = false, -- Enable current/total tabpages indicator
}

local opts = { noremap = true, silent = true }

-- Move between buffers
vim.api.nvim_set_keymap('n', '<TAB>', ':BufferNext<CR>', opts)
vim.api.nvim_set_keymap('n', '<S-TAB>', ':BufferPrevious<CR>', opts)

-- Re-order
vim.api.nvim_set_keymap('n', '<M-.>', ':BufferMoveNext<CR>', opts)
vim.api.nvim_set_keymap('n', '<M-,>', ':BufferMovePrevious<CR>', opts)

-- Close
vim.api.nvim_set_keymap('n', '<M-c>', ':BufferClose!<CR>', opts)
