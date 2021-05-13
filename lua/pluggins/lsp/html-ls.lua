-- HTML LSP
-- npm i -g vscode-html-languageserver-bin

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require 'lspconfig'.html.setup{
	cmd = {"node", "~/lspinstall/html/vscode-html/html-language-features/server/dist/node/htmlServerMain.js", "--stdio"},
    capabilities = capabilities,
}
