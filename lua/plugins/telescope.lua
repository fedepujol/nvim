-- Which-key config

return {
	'nvim-telescope/telescope.nvim',
	keys = {
		{
			'<leader>fh',
			'<cmd>Telescope help_tags<CR>',
			desc = 'Find Help',
		}
	},
	config = function()
		-- Telescope
		require('telescope').setup({
			defaults = {
				vimgrep_arguments = {
					'rg',
					'--color=never',
					'--with-filename',
					'--line-number',
					'--column',
					'--smart-case',
				},
				prompt_prefix = '~ ',
				selection_caret = '> ',
				sorting_strategy = 'ascending',
				layout_strategy = 'horizontal',
				layout_config = {
					prompt_position = 'top',
					horizontal = {
						mirror = false,
					},
					vertical = {
						mirror = false,
					},
				},
				path_display = {
					shorten = 4,
				},
				use_less = true,
				file_ignore_patterns = { './node_modules' },
				set_env = { ['COLORTERM'] = 'truecolor' },
			},
		})
	end,
}
