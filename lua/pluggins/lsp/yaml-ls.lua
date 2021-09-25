-- Yaml LSP
-- npm i -g yaml-language-server
local lsp = require('pluggins.lsp.config')

require('lspconfig').yamlls.setup{
	cmd = {lsp.dir..'/yaml/yaml-language-server.cmd', '--stdio'},
	filetypes = {'yml', 'yaml'},
	root_dir = require('lspconfig/util').root_pattern{'.git', vim.fn.getcwd()},
	on_attach = lsp.common_on_attach
}
