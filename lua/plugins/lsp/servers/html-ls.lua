-- HTML LSP
-- npm i -g vscode-html-languageserver-bin

--Enable (broadcasting) snippet capability for completion
local lsp = require('plugins.lsp.config')

require('lspconfig').html.setup{
	cmd = { lsp.dir.."/html/node_modules/.bin/vscode-html-language-server"..lsp.prefix(), "--stdio" },
	on_attach = lsp.on_attach,
	capabilities = lsp.capabilities,
	handlers = lsp.handlers
}
