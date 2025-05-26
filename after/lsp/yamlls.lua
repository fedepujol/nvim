---@class vim.lsp.Config
return {
	settings = {
		yaml = {
			schemaStore = {
				enable = false,
				url = '',
			},
			schemas = require('schemastore').yaml.schemas(),
			validate = {
				enable = true,
			},
		},
	},
}
