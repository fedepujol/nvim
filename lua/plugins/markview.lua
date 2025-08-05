---@module "lazy"
---@type LazyPluginSpec
return {
	'OXY2DEV/markview.nvim',
	ft = 'markdown',
	config = function()
		require('markview').setup({
			experimental = {
				markdown = {
					code_blocks = {
						label_direction = 'left',
					},
				},
			},
		})
	end,
}
