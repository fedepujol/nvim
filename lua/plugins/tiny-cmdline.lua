---@module "lazy"
---@type LazyPluginSpec
return {
	'rachartier/tiny-cmdline.nvim',
	event = 'UIEnter',
	config = function()
		require('tiny-cmdline').setup({
			width = {
				value = '65%',
			},
			border = 'rounded',
		})
	end,
}
