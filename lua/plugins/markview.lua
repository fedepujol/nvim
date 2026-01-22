---@module "lazy"
---@type LazyPluginSpec
return {
	'OXY2DEV/markview.nvim',
	ft = 'markdown',
	config = function()
		require('markview').setup({
			markdown = {
				list_items = {
					shift_width = 2,
				},
			},
			experimental = {
				fancy_comments = true,
			},
		})
	end,
}
