local lsp = require('plugins.lsp.config')
local config = lsp.build_config()

require('lspconfig').emmet_ls.setup({
	on_attach = config.on_attach,
	capabilities = config.capabilities,
	filtypes = { 'html', 'css' },
	root_dir = config.root_pattern({ '.git', '*.html', '*.css' }),
})
