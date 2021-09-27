-- CSS LSP
-- npm i -g vscode-css-languageserver-bin
local lsp = require('pluggins.lsp.config')

require 'lspconfig'.cssls.setup{
	cmd = { lsp.dir..'/vscode-langservers-extracted/node_modules/.bin/vscode-css-language-server'..lsp.prefix() },
	on_attach = lsp.common_on_attach,
    filetypes = {"css", "scss", "less"},
    settings = {
        css = {
            validate = true
        }
    }
}

