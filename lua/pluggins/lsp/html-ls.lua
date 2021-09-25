-- HTML LSP
-- npm i -g vscode-html-languageserver-bin

--Enable (broadcasting) snippet capability for completion
local lsp = require('pluggins.lsp.config')

require('lspconfig').html.setup{
	cmd = {lsp.dir.."/vscode-extracted/vscode-html-language-server.cmd", "--stdio"},
    capabilities = lsp.capabilities,
	on_attach = lsp.common_on_attach,
}
