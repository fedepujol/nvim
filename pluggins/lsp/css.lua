-- CSS LSP
-- npm i -g vscode-css-languageserver-bin

require 'lspconfig'.cssls.setup{
    filetypes = {"css", "scss", "less"},
    settings = {
        css = {
            validate = true
        }
    }
}

