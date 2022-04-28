-- Bash LSP
local lsp = require('plugins.lsp.config')

require('lspconfig').bashls.setup({
	cmd = { lsp.dir .. '/bash/node_modules/.bin/bash-language-server' .. lsp.prefix(), 'start' },
	on_attach = lsp.on_attach,
	capabilities = lsp.capabilities,
	handlers = lsp.handlers,
	cmd_env = {
		GLOB_PATTERN = '*@(.sh|.inc|.bash|.zsh|.command)',
	},
	filetypes = { 'sh', 'zsh' },
	single_file_support = true
})
