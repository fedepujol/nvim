return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	event = 'VeryLazy',
	config = function()
		-- stylua: ignore
		require('nvim-treesitter.configs').setup({
			ensure_installed = {
				'bash',
				'c', 'comment',
				'diff',
				'ini',
				'json',
				'lua',
				'markdown', 'markdown_inline',
				'nix',
				'sql',
				'vim', 'vimdoc',
				'yaml',
			},
			sync_install = false, -- Install parsers synchronously (only applied to ensure_installed)
			auto_install = true, -- Automatically install missing parsers
			ignore_install = {}, -- list of parsers to ignore installing (for "all")
			indent = {
				enable = true,
			},
			highlight = {
				enable = true, -- false will disable the whole extension
				additional_vim_regex_highlighting = false,
			},
			modules = {},
		})
	end,
}
