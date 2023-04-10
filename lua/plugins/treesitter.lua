return {
	'nvim-treesitter/nvim-treesitter',
	dependencies = {
		{
			'nvim-treesitter/playground',
			cmd = 'TSPlaygroundToggle'
		},
		{
			'p00f/nvim-ts-rainbow'
		}
	},
	config = function()
		require('nvim-treesitter.configs').setup({
			-- one of "all" or a list of languages
			ensure_installed = {
				'bash', 'c', 'cmake', 'cpp',
				'css', 'haskell', 'help', 'hjson',
				'git_config', 'gitignore', 'comment',
				'html', 'http', 'java', 'javascript',
				'ini', 'query', 'rasi', 'sxhkdrc',
				'jsdoc', 'json', 'json5', 'jsonc',
				'llvm', 'lua', 'luadoc', 'luap',
				'markdown', 'markdown_inline', 'nix',
				'pascal', 'python', 'scheme', 'regex',
				'scss', 'toml', 'tsx', 'typescript',
				'vim', 'yaml',
			},
			sync_install = false, -- Install parsers synchronously (only applied to ensure_installed)
			indent = {
				enable = true,
			},
			highlight = {
				enable = true, -- false will disable the whole extension
				-- disable = { 'html' },
				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false,
			},
			rainbow = {
				enable = false,
				extended_mode = false,
				max_file_lines = nil,
			},
			playground = {
				enable = true,
				disable = {},
				updatetime = 25, -- Debounce time for highlighting nodes
				persist_queries = false,
				keybindings = {
					toggle_query_editor = 'o',
					toggle_hl_groups = 'i',
					toggle_injected_languages = 't',
					toggle_anonymous_nodes = 'a',
					toggle_language_display = 'I',
					focus_language = 'f',
					unfocus_language = 'F',
					update = 'R',
					goto_node = '<cr>',
					show_help = '?',
				},
			},
		})
	end
}
