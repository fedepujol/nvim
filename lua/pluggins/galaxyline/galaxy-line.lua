-- GalaxyLine
---------------------------------------------------------------
------------------------   Variables   ------------------------
---------------------------------------------------------------
local gLineSection = require('galaxyline').section
local colors = require('pluggins.galaxyline.colors')
local vimMode = require('pluggins.galaxyline.providers.mode')
local icon = require('pluggins.galaxyline.providers.icon')

local distro = 'arch'

local bufferNotEmtpy = function ()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
end

vim.cmd("hi Statusline guifg='#1e1e1e'")

---------------------------------------------------------------
------------------------ Left Section  ------------------------
---------------------------------------------------------------

gLineSection.left[1] = {
    CustomIcon = {
        provider = function()
            return '  '..icon.getIcon(distro) ..' '
        end,
        highlight = icon.getColor(distro),
    }
}

gLineSection.left[2] = {
    ViMode = {
        provider = function ()
            vim.api.nvim_command('hi GalaxyViMode guifg='..vimMode.getModeColor().fg..' guibg='..vimMode.getModeColor().bg..' gui=bold')
            return '  '..vimMode.getModeAlias()..' '
        end,
        highlight = { colors.black5, colors.black5 },
    }
}

gLineSection.left[3] = {
    FileIcon = {
        provider = {function () return '  ' end, 'FileIcon'},
        highlight = { colors.fg, colors.black5 }
    }
}

gLineSection.left[4] = {
    FileName = {
        provider = 'FileName',
        separator = '~',
        highlight = { colors.fg, colors.black5 },
        separator_highlight = { colors.green5, colors.black5 },
    }
}

gLineSection.left[5] = {
    FileSize = {
        provider = 'FileSize',
        highlight = { colors.green5, colors.black5 },
    }
}

---------------------------------------------------------------
-----------------------  Mid Section   ------------------------
---------------------------------------------------------------
gLineSection.mid[0] = {
    DiagnosticHint  = {
        provider = 'DiagnosticHint',
        icon = ' ',
        highlight = { colors.gray4, colors.black5 },
    }
}

gLineSection.mid[1] = {
    DiagnosticInfo  = {
        provider = 'DiagnosticInfo',
        icon = ' ',
        highlight = { colors.green5, colors.black5 },
    }
}

gLineSection.mid[2] = {
    DiagnosticWarn  = {
        provider = 'DiagnosticWarn',
        icon = ' ',
        highlight = { colors.yellow3, colors.black5 },
    }
}

gLineSection.mid[3] = {
    DiagnosticError  = {
        provider = 'DiagnosticError',
        icon = ' ',
        highlight = { colors.red4, colors.black5 },
    }
}
---------------------------------------------------------------
----------------------- Right Section  ------------------------
---------------------------------------------------------------
gLineSection.right[0] = {
    FileFormat = {
        provider = 'FileFormat',
        highlight = {colors.fg, colors.black5 }
    }
}

gLineSection.right[1] = {
    FileEncode = {
        provider = 'FileEncode',
        separator = ' |',
        highlight = { colors.fg, colors.black5 },
        separator_highlight = { colors.fg, colors.black5 }
   },
}

gLineSection.right[2] = {
    CurrentLine = {
        provider = function () return vim.fn.line('.') end,
        separator = ' | ',
        highlight = {colors.fg, colors.black5 },
        separator_highlight = {colors.fg, colors.black5 }
    }
}

gLineSection.right[3] = {
    LineColumn = {
        provider = function() return vim.fn.col('.')..' ' end,
        separator = ', ',
        highlight = {colors.fg, colors.black5 }, separator_highlight = {colors.fg, colors.black5 } }
}
