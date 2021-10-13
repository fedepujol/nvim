-- Feline setup
local viMode = require('plugins.statusline.cprov.mode')
local colors = require('plugins.statusline.cprov.colors')
local file = require('plugins.statusline.cprov.file')

local components = {
	active = {},
	inactive = {}
}

-- Three part active statusline
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})

-- One part inactive statusline
table.insert(components.inactive, {})

components.active[1][1] = {
	provider = function()
		return ' '..viMode.getModeAlias()..' '
	end,
	hl = function()
		return {
			fg = viMode.getModeColor().fg,
			bg = viMode.getModeColor().bg,
			style = 'bold'
		}
	end,
	left_sep = ' '
}

components.active[1][2] = {
	provider = {
		name = 'file_info',
		hl = function()
			return {
				fg = 'fg'
			}
		end,
	},
	left_sep = ' ',
}

components.active[1][3] = {
	provider = 'diagnostic_errors',
	hl = {
		fg = 'red'
	},
	icon = ''
}
components.active[1][4] = {
	provider = 'diagnostic_warnings',
	hl = {
		fg = 'yellow'
	}
}
components.active[1][5] = {
	provider = 'diagnostic_hints',
	hl = {
		fg = 'fg'
	}
}
components.active[1][6] = {
	provider = 'diagnostic_info',
	hl = {
		fg = 'green'
	}
}

components.active[2][1] = {
	provider = 'git_branch'
}
components.active[2][2] = {
	provider = 'git_diff_added',
	hl = {
		fg = 'git_green'
	},
	left_sep = ' ',
	icon = '+'
}
components.active[2][3] = {
	provider = 'git_diff_removed',
	hl = {
		fg = 'git_red'
	},
	left_sep = ' ',
	icon = '-'
}
components.active[2][4] = {
	provider = 'git_diff_changed',
	hl = {
		fg = 'orange'
	},
	left_sep = ' ',
	icon = '~'
}

components.active[3][1] = {
	provider = file.lsp_client,
	icon = ''
}
components.active[3][2] = {
	provider = file.position,
	icon = ' ',
	left_sep = ' '
}
components.active[3][3] = {
	provider = file.porcentage,
	icon = ' ',
	left_sep = ' ',
}

require('feline').setup{
	components = components,
	colors = {
		fg = '#D0D0D0',
		bg = colors.black3,
		red = colors.red4,
		green = colors.green5,
		yellow = colors.yellow3,
		orange = colors.orange3,
		git_green = colors.green1,
		git_red = colors.red5,
	},
}
