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
		-- Spec
		{
			'fedepujol/cosmos.nvim',
			lazy = false,
			priority = 1000,
			config = function()
				vim.cmd([[color cosmos]])
			end
		},
		{
			'fedepujol/move.nvim',
			cmd = {
				"MoveLine", "MoveBlock", "MoveWord",
			},
		},
		{
			'rktjmp/lush.nvim',
			cmd = 'Lushify',
		},
		{
			'rktjmp/shipwright.nvim',
			cmd = 'Shipwright',
		},
		{ 'folke/which-key.nvim' },
		{
			'mfussenegger/nvim-jdtls',
			ft = 'java',
			dependencies = {
				'mfussenegger/nvim-dap'
			}
		},
		{ import = 'plugins' },
	},
	-- Opts
	{
		defaults = {
			lazy = true
		},
		dev = {
			path = "~/workspace/nvim"
		},
		ui = {
			border = "rounded",
		},
		diff = {
			cmd = 'terminal.git'
		},
		checker = {
			enabled = false,
		},
		change_detection = {
			enabled = false
		},
		performance = {
			cache = {
				enabled = true
			}
		},
	})
