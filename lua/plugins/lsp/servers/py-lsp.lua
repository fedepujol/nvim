local lsp = require('plugins.lsp.config')

require('lspconfig').pylsp.setup{
	cmd = { lsp.dir..'/pylsp/venv/bin/pylsp' },
	filetypes = {'python'},
	on_attach = lsp.on_attach,
	capabilities = lsp.capabilities,
	handlers = lsp.handlers,
	single_file_support = true,
}
