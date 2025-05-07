-- Which-key config

return {
	'nvim-telescope/telescope.nvim',
	event = 'VimEnter',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			-- It requires GCC and make
			-- If used cmake instead, the build step must be changed
			build = 'make',
			cond = function()
				return vim.fn.executable('make') == 1
			end,
		},
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

		local builtin = require("telescope.builtin")
		vim.keymap.set('n', '<leader>sf', function() builtin.find_files({ previewer = false }) end,
			{ desc = "[s]earch [f]iles" })

		vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = "[s]earch by [g]rep" })
		vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[s]earch [h]elp' })
		vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[s]earch [l]sp [d]iagnostics' })

		vim.keymap.set('n', '<leader>sb', function() builtin.buffers({ previewer = false }) end,
			{ desc = '[s]earch [b]uffers' })
	end,
}
