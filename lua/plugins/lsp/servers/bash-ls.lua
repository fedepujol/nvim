-- Bash LSP
local lsp = require('plugins.lsp.config')
local config = lsp.build_config()

require('lspconfig').bashls.setup({
	on_attach = config.on_attach,
	capabilities = config.capabilities,
	cmd_env = {
		GLOB_PATTERN = '*@(.sh|.inc|.bash|.zsh|.command)',
	},
	filetypes = { 'sh', 'zsh' },
	single_file_support = true
})
