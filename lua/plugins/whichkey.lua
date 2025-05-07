-- WhichKey
return {
	'folke/which-key.nvim',
	event = 'VeryLazy',
	config = function()
		require('which-key').setup({
			preset = 'helix',
			plugins = {
				spelling = {
					enable = false,
				},
				presets = {
					operators = false,
					motions = true,
					text_objects = true,
					widnows = true,
					nav = true,
					z = true,
					g = true,
				},
			},
			icons = {
				group = '+',
			},
			show_help = true,
			show_keys = true,
		})

		local wk = require('which-key')

		-- stylua: ignore
		wk.add({
			{ '<leader>b', group = "[b]uffers" },
			{ '<leader>d', group = '[d]ebug' },
			{ '<leader>g', group = "[g]it" },
			{ '<leader>l', group = "[l]sp" },
			{ '<leader>s', group = "[s]earch" },
			{ '<leader>t', group = "[t]erminal" },
			{ '<leader>u', group = '[u]ser settings' },
		})
	end,
}
