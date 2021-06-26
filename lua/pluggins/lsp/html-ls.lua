-- HTML LSP
-- npm i -g vscode-html-languageserver-bin

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
local lsp = require('pluggins.lsp')

capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig').html.setup{
	cmd = {lsp.lsp_dir.."/vscode-extracted/vscode-html-language-server.cmd", "--stdio"},
    capabilities = capabilities,
	on_attach = lsp.common_on_attach,
}
