-- Icon Provider
local colors = require('theme.colors')

local Icon = {
    distros = {
        ['alpine'] = { icon = '', colors = { colors.blue0, colors.white}},
        ['arch'] = { icon = '', colors = { colors.blue1, colors.black3 }},
        ['centos'] = { icon = '', colors = { colors.white, colors.black3 }},
        ['debian'] = { icon = '', colors = { colors.red0, colors.white}},
        ['fedora'] = { icon = '', colors = { colors.blue0, colors.white}},
        ['freebsd'] = { icon = '', colors = { colors.red2, colors.black3 }},
        ['gentoo'] = { icon = '', colors = { colors.white, colors.black3 }},
        ['linux'] = { icon = '', colors = { colors.white, colors.black3 }},
        ['macos'] = { icon = '', colors = { colors.white, colors.black3 }},
        ['manjaro'] = { icon = '', colors = { colors.green3, colors.black3 }},
        ['mageia'] = { icon = '', colors = { colors.white, colors.black3 }},
        ['mandriva'] = { icon = '', colors = { colors.white, colors.black3 }},
        ['mint'] = { icon = '', colors = { colors.green4, colors.black3 }},
        ['nixos'] = { icon = '', colors = { colors.white, colors.black3 }},
        ['opensuse'] = { icon = '', colors = { colors.green5, colors.black3 }},
        ['raspberry'] = { icon = '', colors = { colors.red5, colors.black3 }},
        ['redhat'] = { icon = '', colors = { colors.red5, colors.black3 }},
        ['ubuntu'] = { icon = '', colors = { colors.orange4, colors.black3 }},
        ['unknown'] = { icon = '', colors = { colors.black3, colors.red0 } },
        ['windows'] = { icon = '', colors = { colors.white, colors.black3 }},
    }
}

function Icon.getDistro(os)
    if os ~= nil then
        local di = Icon.distros[os]
        if di == nil then
            return Icon.distros.unknown
        else
            return di
        end
    else
        return Icon.distros.unknown
    end
end

function Icon.getIcon(os)
    return Icon.getDistro(os).icon
end

function Icon.getColor(os)
    return Icon.getDistro(os).colors
end

return Icon
