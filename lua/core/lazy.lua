-- lazy.nvim Config

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local spec = {
	{
		'fedepujol/cosmos.nvim',
		lazy = false,
		-- priority = 1000,
		dev = true,
		config = function()
			vim.cmd([[color cosmos]])
		end,
	},
	{
		'fedepujol/move.nvim',
		cmd = {
			'MoveLine',
			'MoveBlock',
			'MoveWord',
		},
		opts = {
			char = {
				enable = true,
			},
		},
		dev = true,
	},
	{
		'fedepujol/bracketpair.nvim',
		dev = true,
	},
	{
		'rktjmp/lush.nvim',
		cmd = 'Lushify',
	},
	{
		'rktjmp/shipwright.nvim',
		cmd = 'Shipwright',
	},
	{
		'mfussenegger/nvim-jdtls',
		ft = 'java',
		dependencies = {
			'mfussenegger/nvim-dap',
		},
	},
	{ import = 'plugins' },
}

local opts = {
	defaults = {
		lazy = true,
	},
	dev = {
		path = '~/sid/nvim',
	},
	ui = {
		border = 'rounded',
	},
	diff = {
		cmd = 'terminal.git',
	},
	checker = {
		enabled = false,
	},
	change_detection = {
		enabled = true,
	},
	performance = {
		cache = {
			enabled = true,
		},
	},
}

require('lazy').setup(spec, opts)
