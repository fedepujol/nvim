-- WhichKey
require('which-key').setup {
	plugins = {
		spelling = {
			enable = false,
		},
		presets = {
			operators = false,
			motions = true,
			text_objects = true,
			widnows = true,
			nav = true,
			z = true,
			g = true,
		},
	},
	key_labels = {
		["<space>"] = "SPC",
		["<CR>"] = "RET",
		["<Tab>"] = "TAB",
		["<leader>"] = "LEAD"
	},
	window = {
		border = "none",
		position = "bottom",
	},
	show_help = true,
	hidden = {'<silent>', '<cmd>', '<CMD>', '<CR>', 'lua', '^:'},
}
