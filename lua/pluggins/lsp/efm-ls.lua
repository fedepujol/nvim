-- EFM LSP
-- go get github.com/mattn/efm-language
local lsp = require('pluggins.lsp')
require('lspconfig').efm.setup{
	cmd = { lsp.data_dir.."/lspinstall/efm/efm-langserver.exe", "-c="..lsp.config_dir.."efm-langserver/config.yml" },
	init_options = { documentFormatting = true },
	filetypes = {'css', 'html', 'json', 'lua', 'markdown', 'yaml'},
}
