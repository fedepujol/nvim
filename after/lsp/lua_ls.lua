---@class vim.lsp.Config
return {
	settings = {
		Lua = {
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
					'${3rd}/luv/library',
					'${3rd}/busted/library',
				},
			},
		},
	},
}
