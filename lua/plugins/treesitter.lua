return {
	'nvim-treesitter/nvim-treesitter',
	config = function()
		require('nvim-treesitter.configs').setup({
			ensure_installed = {
				'bash',
				'c', 'cmake', 'comment', 'cpp', 'css',
				'hjson', 'html', 'http',
				'ini',
				'java', 'javascript', 'jsdoc', 'json', 'json5', 'jsonc',
				'lua', 'luadoc', 'luap',
				'markdown', 'markdown_inline',
				'nix',
				'python', 'php',
				'query',
				'rasi', 'regex', 'rust',
				'scheme', 'scss', 'sql',
				'toml', 'tsx', 'typescript',
				'vim', 'vimdoc',
				'yaml', 'yuck',
				'xml',
				'zig'
			},
			sync_install = false, -- Install parsers synchronously (only applied to ensure_installed)
			auto_install = true, -- Automatically install missing parsers
			ignore_install = {}, -- list of parsers to ignore installing (for "all")
			indent = {
				enable = true,
			},
			highlight = {
				enable = true, -- false will disable the whole extension
				-- disable = { 'html' },
				additional_vim_regex_highlighting = false,
			},
			modules = {}
		})
	end
}
