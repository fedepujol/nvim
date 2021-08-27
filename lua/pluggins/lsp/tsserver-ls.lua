-- TSServer LSP
-- npm i -g typescript typescript-language-server
local lsp = require('pluggins.lsp')

require('lspconfig').tsserver.setup{
	cmd = {lsp.lsp_dir..'/tsserver/typescript-language-server.cmd', '--stdio'},
	on_attach = lsp.common_on_attach,
	handlers = {
		["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			virtual_text = true,
			underline = true,
			update_in_insert = true,
		})
	},
	capabilities = lsp.capabilities
}
