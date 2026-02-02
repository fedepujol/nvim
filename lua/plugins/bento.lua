---@module "lazy"
---@type LazyPluginSpec
return {
	'serhez/bento.nvim',
	event = 'VeryLazy',
	config = function()
		require('bento').setup({
			ui = {
				floating = {
					minimal_menu = 'dashed',
				},
			},
		})
	end,
}
