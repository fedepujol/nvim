-- GitSigns
return {
	'lewis6991/gitsigns.nvim',
	event = 'BufReadPre',
	config = function()
		require('gitsigns').setup({
			signs = {
				add          = { text = '│' },
				change       = { text = '│' },
				delete       = { text = '_' },
				topdelete    = { text = '‾' },
				changedelete = { text = '~' },
				untracked    = { text = '┆' },
			},
			numhl = true,
			current_line_blame = true,
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = 'eol',
				delay = 2000,
			},
			current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
			preview_config = {
				border = 'rounded',
			},
		})
	end,
}
