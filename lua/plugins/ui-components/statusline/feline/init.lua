-- Feline setup
local viMode = require('plugins.ui-components.statusline.cprov.mode')
local colors = require('plugins.ui-components.statusline.cprov.colors')
local file = require('plugins.ui-components.statusline.cprov.file')
local icon = require('plugins.ui-components.statusline.cprov.icon')

local os = 'freebsd'

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

-- Icon
components.inactive[1][1] = {
	provider = function()
		return ' '..icon.getIcon(os)
	end,
	hl = {
		fg = icon.getColor(os)[1],
		bg = icon.getColor(os)[2],
	}
}

-- Vim Mode
components.active[1][1] = {
	provider = function()
		return ' '..icon.getIcon(os)
	end,
	hl = {
		fg = icon.getColor(os)[1],
		bg = icon.getColor(os)[2],
	}
}
components.active[1][2] = {
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

-- File Info
components.active[1][3] = {
	provider = 'file_info',
	hl = {
		fg = 'fg'
	},
	left_sep = ' ',
}
components.active[1][4] = {
	provider = 'file_size',
	hl = {
		fg = 'fg'
	},
	right_sep = ' '
}

-- Diagnostics
components.active[1][5] = {
	provider = function()
		local count = 0
		count = vim.lsp.diagnostic.get_count(0, [[Error]])
		return count > 0 and ' '..string.format('%d', count) or ''
	end,
	hl = {
		fg = 'red'
	},
	icon = ''
}
components.active[1][6] = {
	provider = 'diagnostic_warnings',
	hl = {
		fg = 'yellow'
	}
}
components.active[1][7] = {
	hl = {
		fg = 'fg'
	}
}
components.active[1][8] = {
	provider = 'diagnostic_info',
	hl = {
		fg = 'green'
	}
}

-- Git Info
components.active[2][1] = {
	provider = 'git_branch',
	hl = {
		fg = 'git_pink',
	}
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

-- Lsp info
components.active[3][1] = {
	provider = file.lsp_client,
	icon = '',
	left_sep = 'left_filled',
	hl = {
		fg = 'lsp_gray',
		bg = 'gray',
	}
}

-- Position
components.active[3][2] = {
	provider = ' ',
	hl = {
		fg = 'gray',
		bg = 'pink'
	},
	left_sep = {
		str = 'left_filled',
		hl = {
			fg = 'pink',
			bg = 'gray'
		}
	}
}
components.active[3][3] = {
	provider = file.position,
	hl = {
		fg = 'pink',
		bg = 'gray'
	}
}

-- Percentage
components.active[3][4] = {
	provider = ' ',
	hl = {
		fg = 'gray',
		bg = 'green'
	},
	left_sep = {
		str = 'left_filled',
		hl = {
			fg = 'green',
			bg = 'gray'
		}
	}
}
components.active[3][5] = {
	provider = file.percentage,
	hl = {
		fg = 'green',
		bg = 'gray'
	}
}

-- Setup
require('feline').setup{
	components = components,
	colors = {
		fg = '#D0D0D0',
		bg = colors.black3,
		red = colors.red4,
		green = colors.green5,
		yellow = colors.yellow3,
		orange = colors.orange3,
		pink = colors.pink6,
		git_pink = colors.pink5,
		gray = colors.black4,
		lsp_gray = colors.gray3,
		git_green = colors.green1,
		git_red = colors.red5,
	},
}
