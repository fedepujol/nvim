-- General Configs
require('pluggins.settings')
require('general')

-- Plugins
require('pluggins')

-- ColorScheme
require('theme')

--[[
vim.loop.spawn = (
	function ()
		local spawn = vim.loop.spawn
		return function(path, options, on_exit)
		local full_path = vim.fn.exepath(path)
		return spawn(full_path, options, on_exit)
	end
end)()]]
