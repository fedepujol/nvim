-- Haskell LSP (hls)
-- hie and ghcide were merge into hls
-- To manually install hls visit https://github.com/haskell/haskell-language-server
local lsp = require('plugins.lsp.config')

require('lspconfig').hls.setup {
	root_dir = lsp.root_pattern('.git', '*.hs'),
	on_attach = lsp.on_attach,
	capabilities = lsp.capabilities,
	handlers = lsp.handlers
}
