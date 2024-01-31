return {
	'nvim-treesitter/nvim-treesitter',
	build = ":TSUpdate",
	config = function()
		require('nvim-treesitter.configs').setup({
			ensure_installed = {
				'bash',
				'c', 'cmake', 'comment', 'cpp', 'css', 'csv',
				'diff',
				'git_config', 'gitattributes', 'gitcommit', 'gitignore',
				'hjson', 'html', 'http',
				'ini',
				'java', 'javascript', 'jsdoc', 'json', 'json5', 'jsonc', 'jq',
				'kotlin',
				'lua', 'luau', 'luadoc', 'luap',
				'markdown', 'markdown_inline',
				'org',
				'nix',
				'passwd', 'php', 'python',
				'query',
				'rasi', 'regex', 'rust',
				'scheme', 'scss', 'sql', 'ssh_config', 'sxhkdrc',
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
				additional_vim_regex_highlighting = false,
			},
			modules = {}
		})
	end
}
