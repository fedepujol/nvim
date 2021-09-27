-- Angular LSP
-- npm i -g @angular/language-server
local lsp = require('pluggins.lsp.config')
local angular_dir = lsp.dir..'/angularls/node_modules/.bin'
local new_cmd = { angular_dir .. '/ngserver'.. lsp.prefix(), '--stdio' }

require('lspconfig').angularls.setup{
	cmd = new_cmd,
	on_new_config = function(new_config, _)
		new_config.cmd = new_cmd
	end,
	on_attach = lsp.common_on_attach,
	capabilities = lsp.capabilities
}

