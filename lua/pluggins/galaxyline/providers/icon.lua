-- Icon Provider
local colors = require('pluggins.galaxyline.colors')

local Icon = {
    distros = {
        ['alpine'] = { icon = '', colors = { colors.white, colors.black }},
        ['arch'] = { icon = '', colors = { colors.blue1, colors.black5 }},
        ['centos'] = { icon = '', colors = { colors.white, colors.black }},
        ['debian'] = { icon = '', colors = { colors.white, colors.black }},
        ['fedora'] = { icon = '', colors = { colors.white, colors.black }},
        ['freebsd'] = { icon = '', colors = { colors.white, colors.black }},
        ['gentoo'] = { icon = '', colors = { colors.white, colors.black }},
        ['linux'] = { icon = '', colors = { colors.white, colors.black }},
        ['macos'] = { icon = '', colors = { colors.white, colors.black }},
        ['manjaro'] = { icon = '', colors = { colors.white, colors.black }},
        ['mageia'] = { icon = '', colors = { colors.white, colors.black }},
        ['mandriva'] = { icon = '', colors = { colors.white, colors.black }},
        ['mint'] = { icon = '', colors = { colors.white, colors.black }},
        ['nixos'] = { icon = '', colors = { colors.white, colors.black }},
        ['opensus'] = { icon = '', colors = { colors.white, colors.black }},
        ['raspberry'] = { icon = '', colors = { colors.white, colors.black }},
        ['redhat'] = { icon = '', colors = { colors.white, colors.black }},
        ['ubuntu'] = { icon = '', colors = { colors.white, colors.black }},
        ['unknown'] = { icon = '', colors = { colors.black, colors.red0 } },
        ['windows'] = { icon = '', colors = { colors.white, colors.black }},
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