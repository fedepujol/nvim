-- Angular LSP
-- npm i -g @angular/language-server
local lsp = require('pluggins.lsp')

require('lspconfig').angularls.setup{
	cmd = {lsp.data_dir..'/lspinstall/angular/node_modules/@angular/language-server/bin/ngserver', '--stdio'},
	filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx" },
	on_attach = lsp.common_on_attach
}

