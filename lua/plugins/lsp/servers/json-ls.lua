-- JSON LSP
local lsp = require('plugins.lsp.config')
local config = lsp.build_config()

require('lspconfig').jsonls.setup({
	on_attach = config.on_attach,
	capabilities = lsp.capabilities,
	root_dir = config.root_pattern({ '.git', vim.fn.getcwd() }),
	commands = {
		Format = {
			function()
				vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line('$'), 0 })
			end,
		},
	},
	settings = {
		json = {
			validate = {
				enable = true,
			},
			schemas = {
				{
					fileMatch = { 'package.json' },
					url = 'https://json.schemastore.org/package.json'
				},
				{
					fileMatch = { 'tsconfig*.json' },
					url = 'https://json.schemastore.org/tsconfig.json'
				},
				{
					fileMatch = { 'tslint.json' },
					url = 'https://json.schemastore.org/tsling.json'
				},
				{
					fileMatch = { '.angular-cli.json' },
					url = 'https://json.schemastore.org/.angular-cli.json'
				},
			}
		}
	}
})
