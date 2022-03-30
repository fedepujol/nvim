-- Vim LSP
local lsp = require('plugins.lsp.config')

require('lspconfig').vimls.setup {
	cmd = { lsp.dir .. '/vim/node_modules/.bin/vim-language-server' .. lsp.prefix(), '--stdio' },
	on_attach = lsp.on_attach,
	init_options = {
		diagnostic = {
			enable = true
		}
	},
	capabilities = lsp.capabilities,
	handlers = lsp.handlers
}
