-- General Configs
require('core')

-- Plugins
require('plugins')

-- Change The Colorscheme
vim.cmd(':colo nv-cosmos')

-- Init HeirLine so it takes the colors
require('plugins.ui.statusline.heirline')
