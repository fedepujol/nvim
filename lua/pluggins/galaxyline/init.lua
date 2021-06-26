-- GalaxyLine
---------------------------------------------------------------
------------------------   Variables   ------------------------
---------------------------------------------------------------
local gLineSection = require('galaxyline').section
local condition = require('galaxyline.condition')
local file_info = require('galaxyline.provider_fileinfo')

local colors = require('pluggins.galaxyline.providers.colors')
local icon = require('pluggins.galaxyline.providers.icon')
local vimMode = require('pluggins.galaxyline.providers.mode')

local distro = 'arch'

---------------------------------------------------------------
------------------------ Left Section  ------------------------
---------------------------------------------------------------
gLineSection.left[0] = {
	CustomIcon = {
		provider = function()
			return '  '..icon.getIcon(distro) ..' '
		end,
		highlight = icon.getColor(distro),
	}
}

gLineSection.left[1] = {
	ViMode = {
		provider = function ()
			vim.api.nvim_command('hi GalaxyViMode guifg='..vimMode.getModeColor().fg..' guibg='..vimMode.getModeColor().bg..' gui=bold')
			return '  '..vimMode.getModeAlias()..' '
		end,
		separator = ' ',
		condition = function()
			local bNE = condition.buffer_not_empty
			local bW = ((vim.api.nvim_win_get_width(0) / 2) > 40)
			return bNE() and bW
		end,
		highlight = { colors.white, colors.black3 },
		separator_highlight = {colors.white, colors.black3},
	}
}

gLineSection.left[2] = {
	FileIcon = {
		provider = 'FileIcon',
		condition = function()
			local bNE = condition.buffer_not_empty
			local bW = ((vim.api.nvim_win_get_width(0) / 2) > 40)
			return bNE() and bW
		end,
		highlight = { file_info.get_file_icon_color, colors.black3 },
	}
}

gLineSection.left[3] = {
	FileName = {
		provider = 'FileName',
		condition = condition.buffer_not_empty,
		highlight = { file_info.get_file_icon_color, colors.black3 },
	}
}

gLineSection.left[4] = {
	FileSize = {
		provider = 'FileSize',
		condition = condition.buffer_not_empty,
		icon = ' ',
		highlight = { colors.green5, colors.black3 },
	}
}

gLineSection.left[5] = {
	DiagnosticInfo  = {
		provider = function ()
			local wc = vim.lsp.diagnostic.get_count(0, [[Warning]])
			local ec = vim.lsp.diagnostic.get_count(0, [[Error]])
			if wc + ec == 0 then
				return ''
			end
		end,
		condition = function()
			local bNE = condition.buffer_not_empty
			local bW = ((vim.api.nvim_win_get_width(0) / 2) > 40)
			return bNE() and bW
		end,
		highlight = { colors.green5, colors.black3 },
	}
}

gLineSection.left[6] = {
	DiagnosticError  = {
		provider = function()
			local count = vim.lsp.diagnostic.get_count(0, [[Error]])
			if count > 0 then
				return ' '..count
			end
		end,
		condition = condition.buffer_not_empty,
		highlight = { colors.red4, colors.black3, 'bold' }
	}
}

gLineSection.left[7] = {
	DiagnosticWarn  = {
		provider = function ()
			local count = vim.lsp.diagnostic.get_count(0, [[Warning]])
			if count > 0 then
				return '   '..count
			end
		end,
		condition = condition.buffer_not_empty,
		highlight = { colors.yellow3, colors.black3, 'bold'}
	}
}

---------------------------------------------------------------
-----------------------  Mid Section   ------------------------
---------------------------------------------------------------
gLineSection.mid[0] = {
	Branch = {
		provider = 'GitBranch',
		condition = function()
			local bNE = condition.buffer_not_empty
			local bW = ((vim.api.nvim_win_get_width(0) / 2) > 40)
			return bNE() and bW
		end,
		icon = ' ',
		highlight = { colors.pink5, colors.black3 }
	}
}

gLineSection.mid[1] = {
	Added = {
		provider = 'DiffAdd',
		condition = condition.buffer_not_empty,
		icon = '+',
		separator = ' ',
		highlight = { colors.green1, colors.black3 },
		separator_highlight = { colors.white, colors.black3 },
	}
}

gLineSection.mid[2] = {
	Modified = {
		provider = 'DiffModified',
		condition = condition.buffer_not_empty,
		icon = '~',
		highlight = { colors.orange3, colors.black3 }
	}
}

gLineSection.mid[3] = {
	Remove = {
		provider = 'DiffRemove',
		condition = condition.buffer_not_empty,
		icon = '-',
		highlight = { colors.red5, colors.black3 }
	}
}
---------------------------------------------------------------
----------------------- Right Section  ------------------------
---------------------------------------------------------------
gLineSection.right[0] = {
	IconLsp = {
		provider = function()
			return ''
		end,
		condition = function()
			local bNE = condition.buffer_not_empty
			local bW = ((vim.api.nvim_win_get_width(0) / 2) > 40)
			return bNE() and bW
		end,
		highlight = { colors.black4, colors.black3},
		separator = ' ',
		separator_highlight = {colors.black4, colors.black3}
	}
}

gLineSection.right[1] = {
	GetLspClient  = {
		provider = 'GetLspClient',
		condition = function()
			local bNE = condition.buffer_not_empty
			local bW = ((vim.api.nvim_win_get_width(0) / 2) > 40)
			return bNE() and bW
		end,
		icon = '  ',
		highlight = { colors.gray3, colors.black4},
	}
}

gLineSection.right[2] = {
	IconLC = {
		provider = function()
			return ''
		end,
		condition = function()
			local bNE = condition.buffer_not_empty
			local bW = ((vim.api.nvim_win_get_width(0) / 2) > 40)
			return bNE() and bW
		end,
		highlight = { colors.pink6, colors.black4},
		separator = ' ',
		separator_highlight = {colors.gray3, colors.black4}
	}
}

gLineSection.right[3] = {
	LineNumber = {
		provider = function()
			local l = vim.fn.line('.')
			local c = vim.fn.col('.')
			if c < 10 then
				c = '0'..c
			end
			if l < 10 then
				l = '0'..l
			end
			return ' '..l..'.'..c
		end,
		condition = function()
			local bNE = condition.buffer_not_empty
			local bW = ((vim.api.nvim_win_get_width(0) / 2) > 40)
			return bNE() and bW
		end,
		separator = ' Lc ',
		highlight = { colors.pink6, colors.black4},
		separator_highlight = {colors.black4, colors.pink6}
	}
}

gLineSection.right[4] = {
	IconLP = {
		provider = function()
			return ''
		end,
		condition = function()
			local bNE = condition.buffer_not_empty
			local bW = ((vim.api.nvim_win_get_width(0) / 2) > 50)
			return bNE() and bW
		end,
		highlight = { colors.green5, colors.black4},
		separator = ' ',
		separator_highlight = {colors.pink6, colors.black4}
	}
}

gLineSection.right[5] = {
	LinePercent = {
		provider = function()
			local cL = vim.fn.line('.')
			local tL = vim.fn.line('$')

			if cL == 1 then
				return " Top "
			elseif cL == vim.fn.line('$') then
				return " Bot "
			end

			local result, _ = math.modf((cL / tL) * 100)
			if result < 10 then
				result = '0'..result
			end
			return ' '..result..'% '
		end,
		condition = function()
			local bNE = condition.buffer_not_empty
			local bW = ((vim.api.nvim_win_get_width(0) / 2) > 40)
			return bNE() and bW
		end,
		highlight = { colors.green5, colors.black4},
		separator = '  ',
		separator_highlight = {colors.black4, colors.green5}
	}
}

