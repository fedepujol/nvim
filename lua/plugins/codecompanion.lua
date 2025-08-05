---@module "lazy"
---@type LazyPluginSpec
return {
	'olimorris/codecompanion.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-treesitter/nvim-treesitter',
	},
	config = function()
		require('codecompanion').setup({
			strategies = {
				chat = {
					adapter = 'copilot',
				},
				inline = {
					adapter = 'copilot',
				},
				agent = {
					adapter = 'copilot',
				},
			},
		})
	end,
}
