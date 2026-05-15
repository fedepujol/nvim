---@module "lazy"
---@type LazyPluginSpec
return {
	'nvim-neo-tree/neo-tree.nvim',
	branch = 'v3.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
		'MunifTanjim/nui.nvim',
	},
	keys = {
		{ '<leader>vt', ':Neotree toggle right<CR>', desc = '[v]iew [t]ree' },
	},
	lazy = true, -- neo-tree will lazily load itself
	config = function()
		---@module "neo-tree"
		---@type neotree.Config?
		require('neo-tree').setup({
			close_if_last_window = true,
			filesystem = {
				group_empty_dirs = true,
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
