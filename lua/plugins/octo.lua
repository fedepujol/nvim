---@module "lazy"
---@type LazyPluginSpec
return {
	'pwntester/octo.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'folke/snacks.nvim',
		'nvim-tree/nvim-web-devicons',
	},
	cmd = 'Octo',
	opts = {
		picker = 'snacks',
		enable_builtin = true,
	},
	keys = {
		{
			'<leader>oi',
			'<CMD>Octo issue list<CR>',
			desc = 'List GitHub Issues',
		},
		{
			'<leader>op',
			'<CMD>Octo pr list<CR>',
			desc = 'List GitHub PullRequests',
		},
		{
			'<leader>od',
			'<CMD>Octo discussion list<CR>',
			desc = 'List GitHub Discussions',
		},
		{
			'<leader>on',
			'<CMD>Octo notification list<CR>',
			desc = 'List GitHub Notifications',
		},
		{
			'<leader>os',
			function()
				require('octo.utils').create_base_search_command({ include_current_repo = true })
			end,
			desc = 'Search GitHub',
		},
	},
}
