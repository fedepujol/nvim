---@module "lazy"
---@type LazyPluginSpec
return {
	'gisketch/triforce.nvim',
	dependencies = {
		'nvzone/volt',
	},
	keys = {
		{
			'<leader>tp',
			function()
				require('triforce').show_profile()
			end,
		},
	},
	config = function()
		require('triforce').setup({
			xp_rewards = {
				char = 0.25,
				line = 0.5,
				save = 25,
			},
		})
	end,
}
