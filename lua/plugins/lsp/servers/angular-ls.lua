-- Angular LSP
-- npm i -g @angular/language-server
local lsp = require('plugins.lsp.config')
local angular_dir = lsp.dir..'/angularls/node_modules'
local ngLangSvc = angular_dir..'/@angular/language-service'
local typescript = angular_dir..'/typescript/lib'
local new_cmd = { angular_dir .. '/.bin/ngserver'.. lsp.prefix(), '--stdio', '--tsProbeLocations', typescript, '--ngProbeLocations', ngLangSvc }

require('lspconfig').angularls.setup{
	cmd = new_cmd,
	on_new_config = function(new_config)
		new_config.cmd = new_cmd
	end,
	on_attach = lsp.common_on_attach,
	capabilities = lsp.capabilities
}

