-- CSS LSP
local lsp = require('plugins.lsp.config')
local config = lsp.build_config()

require('lspconfig').cssls.setup({
	on_attach = config.on_attach,
	capabilities = config.capabilities,
	filetypes = { 'css', 'scss', 'less' },
	settings = {
		css = {
			validate = true,
		},
	},
})
