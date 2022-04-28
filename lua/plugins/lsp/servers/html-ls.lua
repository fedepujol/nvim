-- HTML LSP
--Enable (broadcasting) snippet capability for completion
local lsp = require('plugins.lsp.config')

require('lspconfig').html.setup({
	cmd = { lsp.dir .. '/html/node_modules/.bin/vscode-html-language-server' .. lsp.prefix(), '--stdio' },
	on_attach = lsp.on_attach,
	capabilities = lsp.capabilities,
	handlers = lsp.handlers,
	provideFormatter = true,
	single_file_support = true
})
