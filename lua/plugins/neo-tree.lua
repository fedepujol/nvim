return {
	'nvim-neo-tree/neo-tree.nvim',
	branch = 'v3.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
		'MunifTanjim/nui.nvim',
	},
	lazy = false, -- neo-tree will lazily load itself
	config = function()
		---@module "neo-tree"
		---@type neotree.Config?
		require('neo-tree').setup({
			close_if_last_window = true,
			filesystem = {
				window = {
					mappings = {
						['<F5>'] = 'refresh',
						['<TAB>'] = 'open',
					},
				},
			},
		})
	end,
}
