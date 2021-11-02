-- TSServer LSP
-- npm i -g typescript typescript-language-server
local lsp = require('plugins.lsp.config')

require('lspconfig').tsserver.setup{
	cmd = { lsp.dir..'/tsserver/node_modules/.bin/typescript-language-server'..lsp.prefix(), '--stdio' },
	on_attach = lsp.common_on_attach,
	capabilities = lsp.capabilities,
}
