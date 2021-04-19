-- GalaxyLine
local colors = require('colors')
local gLineSection = require('galaxyline').section
local mode_aliases = {
    [19] = { alias = 'S-BLOCK', color = { fg = colors.black, bg = colors.gray5 }},
    [22] = { alias = 'V-BLOCK', color = { fg = colors.black, bg = colors.orange5 }},
    [82] = { alias = 'REPLACE', color = { fg = colors.white, bg = colors.red3 }},
    [83] = { alias = 'S-LINE', color = { fg = colors.black, bg = colors.gray3 }},
    [86] = { alias = 'V-LINE', color = { fg = colors.black, bg = colors.orange4 }},
    [99] = { alias = 'COMMAND', color = { fg = colors.white, bg = colors.purple1 }},
    [105] = { alias = 'INSERT', color = { fg = colors.white, bg = colors.green0 }},
    [110] = { alias = 'NORMAL', color = { fg = colors.white, bg = colors.blue0 }},
    [115] = { alias = 'SELECT', color = { fg = colors.black, bg = colors.gray1 }},
    [116] = { alias = 'TERMINAL', color = { fg = colors.white, bg = colors.yellow1 }},
    [118] = { alias = 'VISUAL', color = { fg = colors.white, bg = colors.orange0 }},
}


local getCurrentMode = function()
    local cMode = mode_aliases[vim.fn.mode():byte()]
    if cMode == nil then
        cMode = mode_aliases[110]
    end
    return cMode
end

local getModeAlias = function()
    return getCurrentMode().alias
end

local getModeColor = function ()
    return getCurrentMode().color
end

---------------------
--- Left Section ----
---------------------
gLineSection.left[0] = {
    CustomIcon = {
        provider = function()
            return '  '..''..'  '
        end,
        separator = ' | ',
        highlight = { colors.white, colors.blue0, 'bold' }
    }
}

gLineSection.left[1] = {
    ViMode = {
        provider = function ()
            vim.api.nvim_command('hi GalaxyViMode guifg='..getModeColor().fg..' guibg='..getModeColor().bg..' gui=bold')
            return ' '..getModeAlias()..' '
        end,
        separator = ' \\ ',
        highlight = { colors.bg, colors.bg },
    }
}

gLineSection.left[2] = {
    FileIcon = {
        provider = 'FileIcon',
        condition = require('galaxyline.condition').buffer_not_emtpy,
    }
}

gLineSection.left[3] = {
    FileName = {
        provider = 'FileName',
    }
}

----------------------
--- Right Sections ---
----------------------
gLineSection.right[0] = {
    FileFormat = {
        provider = 'FileFormat',
        condition = require('galaxyline.condition').buffer_not_emtpy
    }
}

gLineSection.right[1] = {
    FileEncode = {
        provider = 'FileEncode',
        separator = ' |'
   },
}

gLineSection.right[2] = {
     FileTypeName = {
       provider = 'FileTypeName',
       separator = ' | '
    },
}

gLineSection.right[3] = {
    LinePercent = {
        provider = 'LinePercent',
        separator = ' |',
    }
}

gLineSection.right[4] = {
    LineColumn = {
        provider = 'LineColumn',
    }
}


