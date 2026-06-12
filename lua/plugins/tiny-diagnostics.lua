---@module "lazy"
---@type LazyPluginSpec
return {
	'rachartier/tiny-inline-diagnostic.nvim',
	event = 'LspAttach',
	config = function()
		require('tiny-inline-diagnostic').setup({
			options = {
				multilines = {
					enabled = true,
				},
				show_source = {
					enabled = true,
				},
				add_messages = {
					display_count = true,
				},
			},
		})
	end,
}
