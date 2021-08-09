-- Bash LSP
local lsp = require('pluggins.lsp')

require('lspconfig').bashls.setup{
	cmd = {lsp.lsp_dir..'/bash/node_modules/.bin/bash-language-server', 'start'},
	cmd_env = {
		GLOB_PATTERN = "*@(.sh|.inc|.bash|.zsh|.command)"
	},
	filetypes = {'sh', 'zsh'}
}
