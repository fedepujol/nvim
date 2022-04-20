-- Haskell LSP (hls)
-- hie and ghcide were merge into hls
-- To manually install hls visit https://github.com/haskell/haskell-language-server
local lsp = require('plugins.lsp.config')

require('lspconfig').hls.setup({
	-- cmd = { lsp.dir..'/haskell/haskell-language-server-9.0.2', '--lsp' },
	filetypes = { 'haskell', 'lhaskell' },
	root_dir = lsp.root_pattern('*.cabal', 'stack.yaml', 'cabal.project', 'package.yaml', 'hie.yaml', '*.hs'),
	settings = {
		haskell = {
			formattinProvider = 'ormolu',
		},
	},
	on_attach = lsp.on_attach,
	capabilities = lsp.capabilities,
	handlers = lsp.handlers,
	single_file_support = true,
})
