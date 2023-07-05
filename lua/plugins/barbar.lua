-- BarBar Setup

return {
	'romgrk/barbar.nvim',
	event = 'VeryLazy',
	keys = {
		{ '<TAB>', ':BufferNext<CR>', desc = 'Next Buffer' },
		{ '<S-TAB>', ':BufferPrevious<CR>', desc = 'Prev. Buffer' },
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {
		animation = false, -- Enable animations
		icons = {
			buffer_index = false, -- Show buffer index
			buffer_number = true, -- Show bufnr
			diagnostics = {
				enabled = true,
			},
			gitsigns = {
				enabled = false,
			},
			separator = {
				left = '',
				right = '',
			},
			inactive = {
				separator = {
					left = '',
					right = '',
				},
			},
			filename = {
				custom_colors = true,
			},
		},
		sidebar_filetypes = {
			['neo-tree'] = {
				event = 'BufWipeout',
			},
		},
		insert_at_end = false, -- Enables open new buffer at the end (Defaults to false -> open after current)
		insert_at_start = false, -- Enables open new buffer at the start. Has priority over insert_at_end. (Defualts to false -> open after current)
		maximum_length = 50, -- Maximum buffer name length
		semantic_letters = true,
		no_name_title = 'Undefined', -- Sets the name of unnamed buffers. Only a static string is valid.
		tabpages = true,
	},
}
