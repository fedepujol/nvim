-- HTML LSP
--Enable (broadcasting) snippet capability for completion
local lsp = require('plugins.lsp.config')
local config = lsp.build_config()

require('lspconfig').html.setup({
	on_attach = config.on_attach,
	capabilities = config.capabilities,
	provideFormatter = true,
	single_file_support = true
})
