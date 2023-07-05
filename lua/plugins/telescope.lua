-- Which-key config

return {
	'nvim-telescope/telescope.nvim',
	keys = {
		{
			'<leader>fp',
			"<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>",
			desc = 'Find Files',
		},
		{
			'<leader>fh',
			'<cmd>Telescope help_tags<CR>',
			desc = 'Find Help',
		},
		{
			'<leader>fg',
			'<cmd>Telescope live_grep<CR>',
			desc = 'Live Grep',
		},
	},
	dependencies = {
		{
			'airtonix/telescope-fzf-native.nvim',
			build = function()
				require('telescope-fzf-native').download_library({
					platform = 'windows',
					arch = 'x64',
					compiler = 'cc',
				})
			end
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
		require('telescope').load_extension('fzf')
	end,
}
