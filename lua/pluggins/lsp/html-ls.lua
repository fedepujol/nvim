-- HTML LSP
-- npm i -g vscode-html-languageserver-bin

--Enable (broadcasting) snippet capability for completion
local lsp = require('pluggins.lsp')

require('lspconfig').html.setup{
	cmd = {lsp.lsp_dir.."/vscode-extracted/vscode-html-language-server.cmd", "--stdio"},
    capabilities = lsp.capabilities,
	on_attach = lsp.common_on_attach,
}
