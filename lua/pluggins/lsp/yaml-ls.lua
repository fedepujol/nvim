-- Yaml LSP
-- npm i -g yaml-language-server
local lsp = require('pluggins.lsp')

require 'lspconfig'.yamlls.setup{
	cmd = {lsp.lsp_dir..'/yaml/yaml-language-server.cmd', '--stdio'},
	filetypes = {'yml', 'yaml'},
	root_dir = require('lspconfig/util').root_pattern{'.git', vim.fn.getcwd()},
	on_attach = lsp.common_on_attach
}
