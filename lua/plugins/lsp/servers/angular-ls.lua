-- Angular LSP
local lsp = require('plugins.lsp.config')
local config = lsp.build_config()

local angular_dir = lsp.dir .. '/angularls/node_modules'
local ngLangSvc = angular_dir .. '/@angular/language-service'
local typescript = angular_dir .. '/typescript/lib'
local new_cmd = {
	angular_dir .. '/.bin/ngserver' .. lsp.prefix(),
	'--stdio',
	'--tsProbeLocations',
	typescript,
	'--ngProbeLocations',
	ngLangSvc,
}

require('lspconfig').angularls.setup({
	cmd = new_cmd,
	on_new_config = function(new_config)
		new_config.cmd = new_cmd
	end,
	root_dir = config.root_pattern({'.angular-cli.json', 'angular.json'}),
	on_attach = config.on_attach,
	capabilities = config.capabilities,
})
