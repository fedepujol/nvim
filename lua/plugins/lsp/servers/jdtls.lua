-- Java LSP
local home = 'C:/Program Files/Java'

require('lspconfig').jdtls.setup({
	filetypes = { 'java' },
	settings = {
		java = {
			saveActions = {
				organizeImports = true,
			},
			signatureHelp = {
				enable = true,
			},
			configuration = {
				runtimes = {
					{
						name = 'JavaSE-1.8',
						path = home .. '/jdk1.8.0_144',
					},
					{
						name = 'JavaSE-11',
						path = home .. '/jdk-11.0.12',
					},
				},
			},
		},
	},
})
