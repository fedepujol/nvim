-- Haskell LSP (hls)
-- hie and ghcide were merge into hls
-- To manually install hls visit https://github.com/haskell/haskell-language-server
local lsp = require('plugins.lsp.config')
local config = lsp.build_config()

require('lspconfig').hls.setup({
	filetypes = { 'haskell', 'lhaskell' },
	root_dir = config.root_pattern('*.cabal', 'stack.yaml', 'cabal.project', 'package.yaml', 'hie.yaml', '*.hs'),
	settings = {
		haskell = {
			formattinProvider = 'ormolu',
		},
	},
	on_attach = config.on_attach,
	capabilities = config.capabilities,
	single_file_support = true,
})
