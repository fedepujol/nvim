-- TSServer LSP
-- npm i -g typescript typescript-language-server
require('lspconfig').tsserver.setup{
	cmd = {'typescript-language-server', '--stdio'},
	filetypes = {'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx'},
	on_attach = require('pluggins.lsp').common_on_attach,
}
