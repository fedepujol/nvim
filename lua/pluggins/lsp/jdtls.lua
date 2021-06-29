-- Java LSP
local lsp = require('pluggins.lsp')

local jdt_dir = lsp.lsp_dir..'/lspinstall/jdtls/'

require('lspconfig').jdtls.setup{
	filetypes = {"java"},
	init_options = {
		jvm_args = {}
	}
}