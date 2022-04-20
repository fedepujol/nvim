local lsp = require('plugins.lsp.config')

require('lspconfig').emmet_ls.setup({
	cmd = { lsp.dir .. '/emmet_ls/node_modules/.bin/emmet-ls' .. lsp.prefix(), '--stdio' },
	filtypes = { 'html', 'css' },
	root_dir = lsp.root_pattern({ '.git', '*.html', '*.css' }),
	capabilities = lsp.capabilities,
})
