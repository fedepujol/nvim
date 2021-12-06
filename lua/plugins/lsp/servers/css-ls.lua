-- CSS LSP
-- npm i -g vscode-css-languageserver-bin
local lsp = require('plugins.lsp.config')

require 'lspconfig'.cssls.setup{
	cmd = { lsp.dir..'/cssls/node_modules/.bin/vscode-css-language-server'..lsp.prefix() },
	on_attach = lsp.on_attach,
	capabilities = lsp.capabilities,
	handlers = lsp.handlers,
	filetypes = {"css", "scss", "less"},
	settings = {
		css = {
			validate = true
		}
	}
}

