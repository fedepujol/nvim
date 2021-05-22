-- TSServer LSP
-- npm i -g typescript typescript-language-server
local lsp = require('pluggins.lsp')

require('lspconfig').tsserver.setup{
	cmd = {lsp.data_dir..'/lspinstall/tsserver/node_modules/.bin/typescript-language-server', '--stdio'},
	filetypes = {'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx'},
	root_dir = require('lspconfig/util').root_pattern{'package.json', 'tsconfig.json', 'jsconfig.json', '.git'},
	on_attach = require('pluggins.lsp').common_on_attach,
	handlers = {
		["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			virutal_text = true,
			signs = 'TS',
			underline = true,
			update_in_insert = true,
		})
	},
}
