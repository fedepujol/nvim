return {
	'nvim-neorg/neorg',
	lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
	version = '*', -- Pin Neorg to the latest stable release
	dependencies = {
		'benlubas/neorg-interim-ls',
	},
	config = function()
		require('neorg').setup({
			load = {
				['core.defaults'] = {},
				['core.summary'] = {},
				['core.concealer'] = {
					config = {
						folds = false,
					},
				},
				['core.dirman'] = {
					config = {
						workspaces = {
							pages = vim.fn.expand('~/sid/vault-norg/pages/'),
							journal = vim.fn.expand('~/sid/vault-norg/journals/'),
						},
						default_workspace = 'pages',
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
			},
		})

		vim.wo.conceallevel = 2
	end,
}
