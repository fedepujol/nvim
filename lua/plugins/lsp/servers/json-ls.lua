-- JSON LSP
local lsp = require('plugins.lsp.config')
local config = lsp.build_config()

require('lspconfig').jsonls.setup({
	on_attach = config.on_attach,
	capabilities = lsp.capabilities,
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
					url = 'https://json.schemastore.org/tslint.json'
				},
				{
					fileMatch = { '.angular-cli.json' },
					url = 'https://json.schemastore.org/angular-cli.json'
				},
				{
					fileMatch = { 'angular.json'},
					url = 'https://raw.githubusercontent.com/angular/angular-cli/master/packages/angular/cli/lib/config/workspace-schema.json'
				},
				{
					fileMatch = { '.eslintrc' },
					url = 'https://json.schemastore.org/eslintrc.json'
				},
				{
					fileMatch = { '.vsconfig '},
					url = 'https://json.schemastore.org/vsconfig.json'
				}
			}
		}
	}
})
