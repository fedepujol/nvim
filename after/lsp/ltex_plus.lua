---@class vim.lsp.Config
return {
	filetypes = { 'markdown', 'norg', 'plaintext' },
	settings = {
		ltex = {
			dictionary = {
				['en-GB'] = {
					'ADB',
					'Bufferline',
					'Keybinding',
					'Keybindings',
					'NeoVim',
					'Neovim',
					'NerdFont',
					'NerdFonts',
					'PDE',
					'RTFM',
					'Statusline',
					'angularls',
					'bashls',
					'bufferline',
					'keybinding',
					'keybindings',
					'lua_ls',
					'neovim',
					'nerdfont',
					'nerdfonts',
					'statusline',
					'ts_ls',
					'vim',
					'vimlsp',
					'yamllsp',
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
