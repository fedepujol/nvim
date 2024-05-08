return {
	'folke/trouble.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	keys = {
		{
			'<leader>ltt',
			'<cmd>TroubleToggle<CR>',
			desc = 'Trouble Toggle',
		},
	},
	opts = {
		auto_preview = false,
		signs = {
			use_diagnostic_signs = true,
		},
	},
}
