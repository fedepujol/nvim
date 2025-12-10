---@module "lazy"
---@type LazyPluginSpec
return {
	'gisketch/triforce.nvim',
	dependencies = {
		'nvzone/volt',
	},
	config = function()
		require('triforce').setup({
			keymap = {
				show_profile = '<leader>tp',
			},
			xp_rewards = {
				char = 0.25,
				line = 0.5,
				save = 25,
			},
		})
	end,
}
