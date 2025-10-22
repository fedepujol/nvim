---@module "lazy"
---@type LazyPluginSpec
return {
	'stevearc/oil.nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
	},
	keys = {
		{ '<C-b>', ':Oil --float<CR>', desc = 'Open Oil' },
	},
	config = function()
		require('oil').setup({
			columns = {
				'icon',
				'permissions',
				'size',
			},
			float = {
				border = 'rounded',
			},
			preview_win = {
				win_options = {
					border = 'rounded',
				},
			},
			confirmation = {
				border = 'rounded',
			},
		})
	end,
}
