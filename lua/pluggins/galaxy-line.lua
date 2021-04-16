-- GalaxyLine
local colors = require('galaxyline.theme').default
local gLineSection = require('galaxyline').section

---------------------
--- Left Section ----
---------------------
local num = {
    c = "🅒",
    i = "🅘",
    n = "🅝",
    r = "🅡",
    s = "🅢",
    t = "🅣",
    v = "🅥"
}


local mode_aliases = {
    n = {
        alias = 'normal',
        color = {},
        icon = ''
    },
    i = { alias = 'insert'},
    c = { alias = 'command'},
    t = { alias = 'terminal'},
    v = { alias = 'visual'},
    V = { alias = 'v-line'},
    R = { alias = 'replace'},
    s = { alias = 'select'},
    S = { alias = 's-line'}
}

gLineSection.left[0] = {
    Mode = {
        provider = function ()
            return mode_aliases[vim.fn.mode()].alias
        end,
        separator = ' \\ ',
        hightlight = {colors.fg, colors.bg, 'bold'}
    }
}

gLineSection.left[1] = {
    FileIcon = {
        provider = 'FileIcon',
        condition = require('galaxyline.condition').buffer_not_emtpy,
    }
}

gLineSection.left[2] = {
    FileName = {
        provider = 'FileName',
    }
}

----------------------
--- Right Sections ---
----------------------
gLineSection.right[0] = {
    FileEncode = {
        provider = 'FileEncode',
   },
}

gLineSection.right[1] = {
    LinePercent = {
        provider = 'LinePercent',
        separator = ' |',
    }
}

gLineSection.right[2] = {
    LineColumn = {
        provider = 'LineColumn',
    }
}

gLineSection.right[3] = {
     FileTypeName = {
       provider = 'FileTypeName',
       separator = '| '
    },
}

