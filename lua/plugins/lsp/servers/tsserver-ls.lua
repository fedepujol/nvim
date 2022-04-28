-- TSServer LSP
local lsp = require('plugins.lsp.config')

require('lspconfig').tsserver.setup({
	cmd = { lsp.dir .. '/tsserver/node_modules/.bin/typescript-language-server' .. lsp.prefix(), '--stdio' },
	on_attach = lsp.on_attach,
	capabilities = lsp.capabilities,
	handlers = lsp.handlers,
	hostInfo = "neovim"
})
