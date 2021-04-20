-- Icon Provider
local colors = require('pluggins.galaxyline.colors')

local Icon = {
    distros = {
        ['alpine'] = { icon = '', colors = { colors.blue0, colors.white}},
        ['arch'] = { icon = '', colors = { colors.blue1, colors.black5 }},
        ['centos'] = { icon = '', colors = { colors.white, colors.black }},
        ['debian'] = { icon = '', colors = { colors.red0, colors.white}},
        ['fedora'] = { icon = '', colors = { colors.blue0, colors.white}},
        ['freebsd'] = { icon = '', colors = { colors.red2, colors.black }},
        ['gentoo'] = { icon = '', colors = { colors.white, colors.black }},
        ['linux'] = { icon = '', colors = { colors.white, colors.black }},
        ['macos'] = { icon = '', colors = { colors.white, colors.black }},
        ['manjaro'] = { icon = '', colors = { colors.green3, colors.black }},
        ['mageia'] = { icon = '', colors = { colors.white, colors.black }},
        ['mandriva'] = { icon = '', colors = { colors.white, colors.black }},
        ['mint'] = { icon = '', colors = { colors.green4, colors.black }},
        ['nixos'] = { icon = '', colors = { colors.white, colors.black }},
        ['opensuse'] = { icon = '', colors = { colors.green5, colors.black }},
        ['raspberry'] = { icon = '', colors = { colors.red5, colors.black }},
        ['redhat'] = { icon = '', colors = { colors.red5, colors.black }},
        ['ubuntu'] = { icon = '', colors = { colors.orange4, colors.black }},
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
