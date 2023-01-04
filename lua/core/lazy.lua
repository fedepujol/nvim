-- lazy.nvim Config

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	spec = {
		{
			'fedepujol/nv-themes',
			lazy = false,
			priority = 1000,
			config = function()
				vim.cmd([[colorschem nv-cosmos]])
			end
		},
		{
			'fedepujol/move.nvim',
			cmd = "MoveLine"
		},
		{ 'folke/which-key.nvim' },
		{ import = 'plugins' },
	},
	defaults = { lazy = true },
	diff = { cmd = 'terminal.git' },
	performance = {
		cache = {
			enabled = true
		}
	},
})
