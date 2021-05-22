-- WhichKey

require('which-key').setup {
	plugins = {
		spelling = {
			enable = true,
			suggestions = 20
		},
		presets = {
			operators = true,
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
		["<cr>"] = "RET",
		["<tab>"] = "TAB",
	},
	window = {
		border = "none",
		position = "bottom",
	},
	show_help = true
}
