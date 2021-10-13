-- Java LSP

require('lspconfig').jdtls.setup{
	filetypes = {"java"},
	init_options = {
		jvm_args = {}
	}
}
