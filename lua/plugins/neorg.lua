return {
	'nvim-neorg/neorg',
	lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
	version = '*', -- Pin Neorg to the latest stable release
	ft = 'norg',
	dependencies = {
		'benlubas/neorg-interim-ls',
	},
	config = function()
		require('neorg').setup({
			load = {
				['core.defaults'] = {},
				['core.concealer'] = {
					config = {
						folds = false,
					},
				},
				['external.interim-ls'] = {
					config = {
						completion_provider = {
							categories = true,
							people = {
								enable = true,
							},
						},
					},
				},
				['core.dirman'] = {
					config = {
						workspaces = {
							notes = '~/sid/vault',
						},
						default_workspace = 'notes',
					},
				},
				['core.journal'] = {
					config = {
						journal_folder = 'journals',
						strategy = 'flat',
					},
				},
				['core.completion'] = {
					config = {
						engine = {
							module_name = 'external.lsp-completion',
						},
					},
				},
			},
		})

		vim.wo.conceallevel = 2
	end,
}
