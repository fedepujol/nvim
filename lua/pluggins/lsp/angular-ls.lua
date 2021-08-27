-- Angular LSP
-- npm i -g @angular/language-server
local lsp = require('pluggins.lsp')
local angular_dir = lsp.lsp_dir..'/angular'
local typescript = angular_dir..'/node_modules/typescript/lib'
local ngLanguageS = angular_dir..'/node_modules/@angular/language-service'
local new_cmd = {angular_dir..'/ngserver.cmd', '--tsProbeLocations', typescript, '--ngProbeLocations', ngLanguageS, '--stdio'}

require('lspconfig').angularls.setup{
	cmd = new_cmd,
	on_new_config = function(new_config, new_root_dir)
		new_config.cmd = new_cmd
	end,
	on_attach = lsp.common_on_attach,
	capabilities = lsp.capabilities
}

