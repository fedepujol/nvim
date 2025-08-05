-- Autopairs setup

---@module "lazy"
---@type LazyPluginSpec
return {
	'windwp/nvim-autopairs',
	event = 'BufReadPost',
	config = function()
		require('nvim-autopairs').setup({
			check_ts = true,
		})
	end,
}
