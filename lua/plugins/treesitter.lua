---@module "lazy"
---@type LazyPluginSpec
return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	event = 'VeryLazy',
	config = function()
		-- stylua: ignore
		require('nvim-treesitter.configs').setup({
			ensure_installed = {
				'angular',
				'bash',
				'c', 'comment', 'css', 'cmake',
				'diff', 'dockerfile', 'dot',
				'editorconfig',
				'git_config', 'gitcommit', 'git_rebase', 'gitattributes', 'gitignore',
				'html',
				'ini',
				'javascript',
				'json', 'json5', 'jsonc',
				'lua', 'luau', 'luadoc',
				'markdown', 'markdown_inline',
				'nix', 'norg', 'norg_meta',
				'powershell',
				'scss', 'sql',
				'toml',
				'typescript',
				'vim', 'vimdoc',
				'xml',
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
