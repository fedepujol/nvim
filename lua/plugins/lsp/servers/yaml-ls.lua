-- Yaml LSP
local lsp = require('plugins.lsp.config')
local config = lsp.build_config()

require('lspconfig').yamlls.setup({
	filetypes = { 'yml', 'yaml' },
	root_dir = config.root_pattern({ '.git', vim.fn.getcwd() }),
	on_attach = config.on_attach,
	capabilities = config.capabilities,
})
