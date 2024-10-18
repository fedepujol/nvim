return {
	'stevearc/oil.nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
	},
	keys = {
		{ '<C-b>', ':Oil --float<CR>', desc = 'Oil' },
	},
	config = function()
		require('oil').setup({
			columns = {
				"icon", "permissions", "size"
			}
		})
	end
}
