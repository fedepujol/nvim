-- JSON LSP
local lsp = require('plugins.lsp.config')

require 'lspconfig'.jsonls.setup {
	cmd = { lsp.dir .. '/jsonls/node_modules/.bin/vscode-json-language-server' .. lsp.prefix(), '--stdio' },
	on_attach = lsp.on_attach,
	root_dir = require('lspconfig/util').root_pattern { '.git', vim.fn.getcwd() },
	commands = {
		Format = {
			function()
				vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
			end
		}
	},
	capabilities = lsp.capabilities,
	handlers = lsp.handlers
}
