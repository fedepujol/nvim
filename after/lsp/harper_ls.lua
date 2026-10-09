---@class vim.lsp.Config
return {
	settings = {
		['harper-ls'] = {
			org = {
				Spaces = false,
			},
		},
	},
	filetypes = { 'markdown', 'org', 'norg', 'gitcommit' },
}
