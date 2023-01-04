-- Angular LSP
local lsp = require('plugins.lsp.config')
local config = lsp.build_config()

require('lspconfig').angularls.setup({
	root_dir = config.root_pattern({'.angular-cli.json', 'angular.json'}),
	on_attach = config.on_attach,
	capabilities = config.capabilities,
})
