-- BarBar Setup
vim.g.bufferline = {
	animation = false, -- Enable animations
	auto_hide = false, -- Enable autohidding the bar when there is a single buffer
	tabpages = false, -- Enable current/total tabpages indicator
	closable = true, -- Enables close button
	clickable = true, -- Enables clickable tabs. (Left-click goto buffer, middle-click closes)
	icon_separator_active = '|', -- Separator icon for active tabs
	icon_separator_inactive = '|', -- Separator icon for inactive tabs
	icons = true, -- Enable icons
	insert_at_end = false, -- Enables open new buffer at the end (Defaults to false -> open after current)
	insert_at_start = false, -- Enables open new buffer at the start. Has priority over insert_at_end. (Defualts to false -> open after current)
	maximum_length = 20, -- Maximum buffer name length
	no_name_title = 'Undefined', -- Sets the name of unnamed buffers. Only a static string is valid.
}

local opts = { noremap = true, silent = true }

-- Move between buffers
vim.keymap.set('n', '<TAB>', ':BufferNext<CR>', opts)
vim.keymap.set('n', '<S-TAB>', ':BufferPrevious<CR>', opts)

-- Re-order
vim.keymap.set('n', '<M-.>', ':BufferMoveNext<CR>', opts)
vim.keymap.set('n', '<M-,>', ':BufferMovePrevious<CR>', opts)

-- Close
vim.keymap.set('n', '<M-c>', ':BufferClose!<CR>', opts)
