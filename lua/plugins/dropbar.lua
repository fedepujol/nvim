return {
	'Bekaboo/dropbar.nvim',
	event = 'LspAttach',
	dependencies = {
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make',
	},
	config = function()
		local dropbar_api = require('dropbar.api')
		vim.keymap.set('n', '<leader>lp', dropbar_api.pick, { desc = '[l]sp dropbar [p]ick' })
	end,
}
