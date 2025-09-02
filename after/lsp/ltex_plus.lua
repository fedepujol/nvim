---@class vim.lsp.Config
return {
	filetypes = { 'markdown', 'norg', 'plaintext' },
	settings = {
		ltex = {
			dictionary = {
				-- stylua: ignore
				['en-GB'] = {
					-- Commands
					'rm', 'grep', 'cd', 'awk', 'fzf', 'ls',
					'nvim', 'vim', 'gpg', 'cmake',

					-- Program names
					'Neovim', 'Vim',

					-- Packages
					'neovim',

					-- LSPs
					'angularls',
					'bashls',
					'lua_ls',
					'ts_ls',
					'vimlsp',
					'yamllsp',

					-- Languages
					'lua', 'vimscript',
					'VimScript',

					-- Java
					'BigDecimal',

					-- Neovim/Vim
					':%s', 'gCTRL-A', 'gCTRL-X', '%s',

					-- Abbreviations
					'ADB', 'PDE', 'PKB', 'RTFM',
					'usr', 'bin',

					'Tab-line',
					'tab-line',
					'NerdFont',
					'RelWithDebInfo',
					'Status-line',
					'status-line',
				},
			},
			language = 'en-GB',
			disabledRules = {
				['en-GB'] = { 'WHITESPACE_RULE' },
			},
			additionalRules = {
				motherTongue = 'es-AR',
			},
		},
	},
}
