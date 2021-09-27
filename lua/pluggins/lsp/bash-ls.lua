-- Bash LSP
local lsp = require('pluggins.lsp.config')

require('lspconfig').bashls.setup{
	cmd = { lsp.dir..'/bash/node_modules/.bin/bash-language-server'..lsp.prefix(), 'start' },
	cmd_env = {
		GLOB_PATTERN = "*@(.sh|.inc|.bash|.zsh|.command)"
	},
	filetypes = {'sh', 'zsh'}
}
