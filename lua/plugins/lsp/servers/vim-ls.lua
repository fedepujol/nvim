-- Vim LSP
local lsp = require('plugins.lsp.config')

require('lspconfig').vimls.setup({
	cmd = { lsp.dir .. '/vim/node_modules/.bin/vim-language-server' .. lsp.prefix(), '--stdio' },
	on_attach = lsp.on_attach,
	init_options = {
		diagnostic = {
			enable = true,
		},
		indexes = {
			count = 3,
			gap = 100,
			projectRootPatterns = { 'runtime', 'nvim', '.git', 'autoload', 'plugin' },
			runtimepath = true,
		},
		isNeovim = true,
		suggest = {
			fromRuntimepath = true,
			fromVimruntime = true,
		},
	},
	capabilities = lsp.capabilities,
	handlers = lsp.handlers,
})
