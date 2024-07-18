return {
	'nvim-neo-tree/neo-tree.nvim',
	branch = 'v3.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-lua/popup.nvim',
		'MunifTanjim/nui.nvim',
	},
	keys = {
		{ '<C-b>', ':Neotree toggle<CR>', desc = 'NeoTree' },
	},
	config = function()
		require('neo-tree').setup({
			close_if_last_window = true,
			enable_diagnostics = false,
			default_component_configs = {
				indent = {
					with_markers = true,
					with_expanders = true,
				},
				modified = {
					symbol = '',
				},
				git_status = {
					symbols = {
						-- Change type
						added = '',
						deleted = '',
						modified = '',
						renamed = '󰑕',
						-- Status type
						conflict = '',
						ignored = 'I',
						staged = 'S',
						unstaged = '',
						untracked = 'U',
					},
				},
			},
			window = {
				mappings = {
					['<tab>'] = 'toggle_node',
				},
			},
			filesystem = {
				follow_current_file = {
					enabled = true,
					leave_dirs_open = false,
				},
				group_empty_dirs = true,
			},
			nesting_rules = {
				['component.html'] = { 'component.css', 'component.ts' },
			},
		})
	end,
}
