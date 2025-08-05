---@module "lazy"
---@type LazyPluginSpec
return {
	'zbirenbaum/copilot.lua',
	cmd = 'Copilot',
	config = function()
		require('copilot').setup({})
	end,
}
