-- ViMode Provider
local colors = require('pluggins.galaxyline.colors')

local VMode = {
    mode_aliases = {
        [19] = { alias = 'S-BLOCK', color = { fg = colors.black0, bg = colors.gray5 }},
        [22] = { alias = 'V-BLOCK', color = { fg = colors.black0, bg = colors.orange5 }},
        [82] = { alias = 'REPLACE', color = { fg = colors.white, bg = colors.red3 }},
        [83] = { alias = 'S-LINE', color = { fg = colors.black0, bg = colors.gray3 }},
        [86] = { alias = 'V-LINE', color = { fg = colors.black0, bg = colors.orange4 }},
        [99] = { alias = 'COMMAND', color = { fg = colors.white, bg = colors.purple3 }},
        [105] = { alias = 'INSERT', color = { fg = colors.white, bg = colors.green0 }},
        [110] = { alias = 'NORMAL', color = { fg = colors.white, bg = colors.blue0 }},
        [115] = { alias = 'SELECT', color = { fg = colors.black0, bg = colors.gray1 }},
        [116] = { alias = 'TERMINAL', color = { fg = colors.white, bg = colors.yellow1 }},
        [118] = { alias = 'VISUAL', color = { fg = colors.white, bg = colors.orange0 }},
    }
}

function VMode.getCurrentMode()
    local cMode = VMode.mode_aliases[vim.fn.mode():byte()]
    if cMode == nil then
        cMode = VMode.mode_aliases[110]
    end
    return cMode
end

function VMode.getModeAlias()
    return VMode.getCurrentMode().alias
end

function VMode.getModeColor()
    return VMode.getCurrentMode().color
end

return VMode