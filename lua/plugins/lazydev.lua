---@module "lazy"
---@type LazyPluginSpec
return {
	'folke/lazydev.nvim',
	ft = 'lua',
	dependencies = {
		{ 'saghen/blink.cmp' },
		{ 'Bilal2453/luvit-meta', lazy = true },
		{ 'gonstoll/wezterm-types', lazy = true },
	},
	opts = {
		library = {
			'lazy.nvim',
			{ path = 'luvit-meta/library', words = { 'vim%.uv' } },
			{ path = 'wezterm-types', mods = { 'wezterm' } },
		},
	},
}
