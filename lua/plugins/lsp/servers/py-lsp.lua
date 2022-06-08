local lsp = require('plugins.lsp.config')
local config = lsp.build_config()

require('lspconfig').pylsp.setup({
	filetypes = { 'python' },
	on_attach = config.on_attach,
	capabilities = config.capabilities,
	single_file_support = true,
})
