---@module "lazy"
---@type LazyPluginSpec
return {
	'folke/lazydev.nvim',
	ft = 'lua',
	dependencies = {
		{ 'saghen/blink.cmp' },
		{ 'gonstoll/wezterm-types', lazy = true },
		{ 'Bilal2453/luvit-meta', lazy = true },
	},
	opts = {
		library = {
			'lazy.nvim',
			'nvim-dap-ui',
			{ path = 'luvit-meta/library', words = { 'vim%.uv' } },
			{ path = 'wezterm-types', mods = { 'wezterm' } },
			{ path = 'snacks.nvim', words = { 'Snacks' } },
		},
	},
}
