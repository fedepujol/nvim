-- Which-key config

return {
	'nvim-telescope/telescope.nvim',
	event = 'VimEnter',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
			cond = function()
				return vim.fn.executable('make') == 1
			end
		}
	},
	keys = {
		{
			'<leader>fp',
			'<cmd>lua require("telescope.builtin").find_files({previewer = false})<CR>',
			desc = 'Find Files',
		},
		{
			'<leader>fg',
			'<cmd>Telescope live_grep<CR>',
			desc = 'Live Grep',
		},
		{
			'<leader>fh',
			'<cmd>Telescope help_tags<CR>',
			desc = 'Find Help',
		}
	},
	config = function()
		require('telescope').setup({
			defaults = {
				prompt_prefix = '~ ',
				selection_caret = '> ',
				layout_strategy = 'horizontal',
				path_display = {
					shorten = 4,
				},
			},
		})

		pcall(require('telescope').load_extension, 'fzf')
	end,
}
