-- CSS LSP
-- npm i -g vscode-css-languageserver-bin
local lsp = require('pluggins.lsp')

require 'lspconfig'.cssls.setup{
	cmd = {lsp.lsp_dir..'/vscode-extracted/vscode-css-language-server.cmd'},
	on_attach = lsp.common_on_attach,
    filetypes = {"css", "scss", "less"},
    settings = {
        css = {
            validate = true
        }
    }
}

