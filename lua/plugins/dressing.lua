-- Dressing config
---@module "lazy"
---@type LazyPluginSpec
return {
	'stevearc/dressing.nvim',
	event = 'VeryLazy',
	config = function()
		require('dressing').setup()
	end,
}
