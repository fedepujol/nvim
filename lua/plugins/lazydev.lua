return {
	{
		'folke/lazydev.nvim',
		ft = 'lua',
		opts = {
			library = {
				'lazy.nvim',
				{ path = 'LazyVim',            words = { 'LazyVim' } },
				{ path = 'luvit-meta/library', words = { 'vim%.uv' } },
				{ path = 'wezterm-types',      mods = { 'wezterm' } },
			},
		},
	},
	{ 'saghen/blink.cmp' },
	{ 'Bilal2453/luvit-meta',   lazy = true },
	{ 'gonstoll/wezterm-types', lazy = true },
}
