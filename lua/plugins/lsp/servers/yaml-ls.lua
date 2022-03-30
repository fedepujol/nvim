-- Yaml LSP
local lsp = require('plugins.lsp.config')

require('lspconfig').yamlls.setup {
	cmd = { lsp.dir .. '/yaml/node_modules/.bin/yaml-language-server' .. lsp.prefix(), '--stdio' },
	filetypes = { 'yml', 'yaml' },
	root_dir = require('lspconfig/util').root_pattern { '.git', vim.fn.getcwd() },
	on_attach = lsp.on_attach,
	capabilities = lsp.capabilities,
	handlers = lsp.handlers
}
