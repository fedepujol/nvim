-- EFM LSP
-- go get github.com/mattn/efm-language
local lsp = require('pluggins.lsp')

require('lspconfig').efm.setup{
	cmd = { lsp.lsp_dir.."/efm/efm-langserver", "-c="..lsp.config_dir().."efm-langserver/config.yml" },
	init_options = { documentFormatting = true },
	filetypes = {'css', 'html', 'json', 'lua', 'markdown', 'typescript', 'yaml'},
}
