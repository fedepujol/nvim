return {
	'folke/trouble.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	keys = {
		{
			'<leader>ltd',
			':Trouble diagnostics<CR>',
			desc = 'Trouble Diagnostics',
		},
	},
	opts = {
		auto_preview = false,
		signs = {
			use_diagnostic_signs = true,
		},
	},
}
