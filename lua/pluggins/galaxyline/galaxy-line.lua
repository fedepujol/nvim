-- GalaxyLine
---------------------------------------------------------------
------------------------   Variables   ------------------------
---------------------------------------------------------------
local gl = require('galaxyline')
local gLineSection = gl.section
local colors = require('pluggins.galaxyline.colors')
local vimMode = require('pluggins.galaxyline.providers.mode')
local icon = require('pluggins.galaxyline.providers.icon')

local distro = 'arch'

local buffer_not_emtpy = function ()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
end

vim.cmd("hi Statusline guifg='#1e1e1e'")

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
        highlight = { colors.black5, colors.black5 },
    }
}

gLineSection.left[2] = {
    FileIcon = {
        provider = {function () return '  ' end, 'FileIcon'},
        condition = buffer_not_emtpy(),
        highlight = { colors.fg, colors.black5 }
    }
}

gLineSection.left[3] = {
    FileName = {
        provider = 'FileName',
        condition = buffer_not_emtpy(),
        separator = '~',
        highlight = { colors.fg, colors.black5 },
        separator_highlight = { colors.green0, colors.black5 },
    }
}

gLineSection.left[4] = {
    FileSize = {
        provider = 'FileSize',
        condition = buffer_not_emtpy(),
        highlight = { colors.green0, colors.black5 },
    }
}

---------------------------------------------------------------
-----------------------  Mid Section   ------------------------
---------------------------------------------------------------
gLineSection.mid[0] = {
    DiagnosticHint  = {
        provider = 'DiagnosticHint',
        icon = ' ',
        highlight = { colors.gray0, colors.black5 },
        separator_highlight = { colors.green0, colors.black5 },
    }
}

gLineSection.mid[1] = {
    DiagnosticInfo  = {
        provider = 'DiagnosticInfo',
        icon = ' ',
        highlight = { colors.green0, colors.black5 },
        separator_highlight = { colors.green0, colors.black5 },
    }
}

gLineSection.mid[2] = {
    DiagnosticWarn  = {
        provider = 'DiagnosticWarn',
        icon = ' ',
        highlight = { colors.yellow3, colors.black5 },
        separator_highlight = { colors.yellow3, colors.black5 },
    }
}

gLineSection.mid[3] = {
    DiagnosticError  = {
        provider = 'DiagnosticError',
        icon = ' ',
        highlight = { colors.red0, colors.black5 },
    }
}
---------------------------------------------------------------
----------------------- Right Section  ------------------------
---------------------------------------------------------------
gLineSection.right[0] = {
    FileFormat = {
        provider = 'FileFormat',
        condition = buffer_not_emtpy(),
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
        separator = ' | Ln ',
        highlight = {colors.fg, colors.black5 },
        separator_highlight = {colors.fg, colors.black5 }
    }
}

gLineSection.right[3] = {
    LineColumn = {
        provider = function() return vim.fn.col('.')..' ' end,
        separator = ', Col ',
        highlight = {colors.fg, colors.black5 },
        separator_highlight = {colors.fg, colors.black5 }
    }
}