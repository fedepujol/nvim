-- TSServer LSP
local lsp = require('plugins.lsp.config')
local config = lsp.build_config()

require('lspconfig').tsserver.setup({
	on_attach = config.on_attach,
	capabilities = config.capabilities,
	hostInfo = "neovim"
})
