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
		wk.add({
			{ '<leader>b', group = '[b]uffers', icon = { icon = '󰈔', color = 'cyan' } },
			{ '<leader>d', group = '[d]ebug', icon = { icon = ' ', color = 'red' } },
			{ '<leader>g', group = '[g]it', icon = { icon = ' ', color = 'orange' } },
			{ '<leader>l', group = '[l]sp', icon = { icon = ' ', color = 'purple' } },
			{ '<leader>s', group = '[s]earch', icon = { icon = ' ', color = 'blue' } },
			{ '<leader>t', group = '[t]erminal', icon = { icon = ' ', color = 'green' } },
			{ '<leader>u', group = '[u]ser settings', icon = { icon = ' ', color = 'azure' } },
		})
	end,
}
