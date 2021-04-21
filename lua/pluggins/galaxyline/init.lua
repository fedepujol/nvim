-- GalaxyLine
---------------------------------------------------------------
------------------------   Variables   ------------------------
---------------------------------------------------------------
local gLineSection = require('galaxyline').section
local condition = require('galaxyline.condition')

local colors = require('theme.colors')
local icon = require('pluggins.galaxyline.providers.icon')
local vimMode = require('pluggins.galaxyline.providers.mode')
local space = require('pluggins.galaxyline.providers.space')

local distro = 'arch'

local bufferNotEmtpy = function ()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
end

vim.cmd("hi Statusline guifg='#161616'")

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
        highlight = { colors.white, colors.black3 },
    }
}

gLineSection.left[3] = {
    FileIcon = {
        provider = {function () return '  ' end, 'FileIcon'},
        condition = bufferNotEmtpy,
        highlight = { colors.fg, colors.black3 }
    }
}

gLineSection.left[4] = {
    FileName = {
        provider = 'FileName',
        condition = bufferNotEmtpy,
        highlight = { colors.white, colors.black3 },
    }
}

gLineSection.left[5] = {
    FileSize = {
        provider = 'FileSize',
        condition = bufferNotEmtpy,
        icon = ' ',
        highlight = { colors.green5, colors.black3 },
    }
}

---------------------------------------------------------------
-----------------------  Mid Section   ------------------------
---------------------------------------------------------------
gLineSection.mid[0] = {
    GetLspClient  = {
        provider = 'GetLspClient',
        condition = condition.buffer_not_empty,
        icon = ' ',
        highlight = { colors.white, colors.black3 },
    }
}

gLineSection.mid[1] = {
    Space  = {
        provider = function ()
            return ' '
        end,
        condition = condition.buffer_not_empty,
        highlight = { colors.black3, colors.black3 },
    }
}

gLineSection.mid[2] = {
    DiagnosticError  = {
        provider = function()
            local count = vim.lsp.diagnostic.get_count(0, [[Error]])
            return ' '..count
        end,
        highlight = { colors.red4, colors.black3 }
    }
}

gLineSection.mid[3] = {
    Space  = {
        provider = function ()
            return ' '
        end,
        condition = condition.buffer_not_empty,
        highlight = { colors.black3, colors.black3 },
    }
}

gLineSection.mid[4] = {
    DiagnosticWarn  = {
        provider = function ()
            local count = vim.lsp.diagnostic.get_count(0, [[Warning]])
            return ' '..count
        end,
        highlight = { colors.yellow3, colors.black3 }
    }
}

gLineSection.mid[5] = {
    Space  = {
        provider = function ()
            return ' '
        end,
        condition = condition.buffer_not_empty,
        highlight = { colors.black3, colors.black3 },
    }
}

gLineSection.mid[6] = {
    DiagnosticInfo  = {
        provider = function ()
            local count = vim.lsp.diagnostic.get_count(0, [[Info]])
            return ' '..count
        end,
        highlight = { colors.green5, colors.black3 },
    }
}

---------------------------------------------------------------
----------------------- Right Section  ------------------------
---------------------------------------------------------------
gLineSection.right[0] = {
    FileFormat = {
        provider = 'FileFormat',
        highlight = {colors.white, colors.black3 }
    }
}

gLineSection.right[1] = {
    FileEncode = {
        provider = 'FileEncode',
        separator = ' |',
        highlight = { colors.white, colors.black3 },
        separator_highlight = { colors.white, colors.black3 }
   },
}

gLineSection.right[2] = {
    CurrentLine = {
        provider = function () return vim.fn.line('.') end,
        separator = ' | ',
        highlight = {colors.white, colors.black3 },
        separator_highlight = {colors.white, colors.black3 }
    }
}

gLineSection.right[3] = {
    LineColumn = {
        provider = function() return vim.fn.col('.')..' ' end,
        separator = ', ',
        highlight = {colors.white, colors.black3 }, 
        separator_highlight = {colors.white, colors.black3 } }
}
