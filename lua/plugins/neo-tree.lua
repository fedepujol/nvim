return {
	'nvim-neo-tree/neo-tree.nvim',
	branch = 'v2.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-lua/popup.nvim',
		'MunifTanjim/nui.nvim',
	},
	keys = {
		{ '<C-b>', ':NeoTreeShow<CR>', desc = 'NeoTree' }
	},
	config = function()
		vim.cmd([[let g:neo_tree_remove_legacy_commands = 1 ]])

		require('neo-tree').setup({
			close_if_last_window = true,
			enable_diagnostics = false,
			default_component_configs = {
				indent = {
					with_markers = true,
					with_expanders = true
				},
				modified = {
					symbol = '',
				},
				git_status = {
					symbols = {
						-- Change type
						added     = '',
						deleted   = '',
						modified  = '',
						renamed   = '󰑕',
						-- Status type
						conflict  = '',
						ignored   = 'I',
						staged    = 'S',
						unstaged  = '',
						untracked = 'U',
					},
				}
			},
			window = {
				mappings = {
					['<tab>'] = 'toggle_node',
				},
			},
			source_selector = {
				sources = {
					{ source = "filesystem", display_name = " 󰉓  Files" },
					{ source = "git_status", display_name = " 󰊢  Git" },
				},
			},
			filesystem = {
				follow_current_file = true,
				group_empty_dirs = true
			},
			nesting_rules = {
				["component.html"] = { "component.css", "component.ts" }
			}
		})
	end
}
