-- GalaxyLine
---------------------------------------------------------------
------------------------   Variables   ------------------------
---------------------------------------------------------------
local gLineSection = require('galaxyline').section
local condition = require('galaxyline.condition')

local colors = require('theme.colors')
local icon = require('pluggins.galaxyline.providers.icon')
local vimMode = require('pluggins.galaxyline.providers.mode')
local treesitter = require('nvim-treesitter')

local distro = 'arch'

local patterns = {
	ni = { reg = '//.*$', icon = ''},
	bracket = { reg = '%s*[%[%(%{]*%s*$', icon = ''},
	se = { reg = '%(.*%)', icon = ''},
	cur = { reg = '%s*=>%s*$', icon = '  '},
	async = { reg = '^async%s*', icon = '  '},
	static = { reg = '^static%s*', icon = ' '},
	functions = { reg = '^function%s*', icon = '  '},
	class = { reg = '^class%s*', icon = '  '},
	extends = {reg = '%s*extends.*$', icon = '  '},
}

vim.cmd("hi Statusline guifg='#161616'")
vim.cmd("hi StatusLineNc guifg='#161616'")

function treeUtils(line)
	for _, p in pairs(patterns) do
		line = line:gsub(p.reg, p.icon) end
	return line
end
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
        highlight = { colors.white, colors.black3 },
        separator_highlight = { colors.white, colors.black3 },
    }
}

gLineSection.left[2] = {
    FileName = {
        provider = 'FileName',
        condition = condition.buffer_not_empty,
        highlight = { colors.white, colors.black3 },
    }
}

gLineSection.left[3] = {
    FileSize = {
        provider = 'FileSize',
        condition = condition.buffer_not_empty,
        icon = ' ',
        highlight = { colors.green5, colors.black3 },
    }
}

gLineSection.left[4] = {
    DiagnosticInfo  = {
        provider = function ()
			local wc = vim.lsp.diagnostic.get_count(0, [[Warning]])
			local ec = vim.lsp.diagnostic.get_count(0, [[Error]])
			if wc + ec == 0 then
	            return ''
			end
        end,
        condition = condition.buffer_not_empty,
        highlight = { colors.green5, colors.black3 },
    }
}

gLineSection.left[5] = {
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

gLineSection.left[6] = {
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
	TreeSitter = {
		provider = function()
			return treesitter.statusline({
				indicator_size = 80,
				type_patterns = {'class', 'function', 'method'},
				transform_fn = treeUtils,
				separator = ' > '
			})
			end,
		condition = condition.buffer_not_empty,
	}
}

---------------------------------------------------------------
----------------------- Right Section  ------------------------
---------------------------------------------------------------
gLineSection.right[0] = {
    GetLspClient  = {
        provider = 'GetLspClient',
        condition = condition.buffer_not_empty,
        icon = ' ',
        highlight = { colors.white, colors.black3 },
    }
}

gLineSection.right[1] = {
    FileIcon = {
        provider = 'FileIcon',
		condition = condition.buffer_not_empty,
		separator = ' | ',
        highlight = { colors.fg, colors.black3 }
    }
}

gLineSection.right[2] = {
	FileTypeName = {
		provider = function() return vim.fn.expand('%:e') end,
		condition = condition.buffer_not_empty,
		highlight = { colors.white, colors.black3 },
		separator_highlight = { colors.white, colors.black3 },
	}
}

gLineSection.right[3] = {
    FileFormat = {
        provider = 'FileFormat',
	separator = ' | ',
        highlight = {colors.white, colors.black3 },
	separator_highlight = { colors.white, colors.black3 }
    }
}

gLineSection.right[4] = {
    FileEncode = {
		provider = 'FileEncode',
        separator = ' |',
        highlight = { colors.white, colors.black3 },
        separator_highlight = { colors.white, colors.black3 }
   },
}

gLineSection.right[5] = {
    CurrentLine = {
        provider = function () return vim.fn.line('.') end,
        separator = ' | ',
        highlight = {colors.white, colors.black3 },
        separator_highlight = {colors.white, colors.black3 }
    }
}

gLineSection.right[6] = {
    LineColumn = {
        provider = function() return vim.fn.col('.')..' ' end,
        separator = ', ',
        highlight = {colors.white, colors.black3 },
        separator_highlight = {colors.white, colors.black3 } }
}
