-- Vim LSP
local lsp = require('plugins.lsp.config')
local config = lsp.build_config()

require('lspconfig').vimls.setup({
	on_attach = config.on_attach,
	capabilities = lsp.capabilities,
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
})
