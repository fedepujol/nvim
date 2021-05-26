-- Angular LSP
-- npm i -g @angular/language-server
local lsp = require('pluggins.lsp')

require('lspconfig').angularls.setup{
	cmd = {lsp.data_dir..'/lspinstall/angular/node_modules/@angular/ngserver.cmd', '--stdio'},
	filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx" },
	root_dir = require('lspconfig/util').root_pattern{'angular.json', '.git'},
	on_attach = lsp.common_on_attach,
}

