-- TSServer LSP
-- npm i -g typescript typescript-language-server
local lsp = require('pluggins.lsp')

require('lspconfig').tsserver.setup{
	cmd = {lsp.lsp_dir..'/tsserver/typescript-language-server.cmd', '--stdio'},
	filetypes = {'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx'},
	root_dir = lsp.root_pattern{'package.json', 'tsconfig.json', 'jsconfig.json', '.git'},
	on_attach = lsp.common_on_attach,
	handlers = {
		["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			virtual_text = true,
			underline = true,
			update_in_insert = true,
		})
	},
}
