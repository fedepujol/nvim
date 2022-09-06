-- Yaml LSP
local lsp = require('plugins.lsp.config')
local config = lsp.build_config()

require('lspconfig').yamlls.setup({
	filetypes = { 'yml', 'yaml' },
	root_dir = config.root_pattern({ '.git', vim.fn.getcwd() }),
	on_attach = config.on_attach,
	capabilities = config.capabilities,
	settings = {
		yaml = {
			schemas = {
				['https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json'] = 'docker-compose.yml',
				['https://yarnpkg.com/configuration/yarnrc.json'] = '.yarnrc.yml',
				['https://json.schemastore.org/yamllint.json'] = 'yamllint',
			}
		}
	}
})
