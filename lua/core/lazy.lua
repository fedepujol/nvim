-- lazy.nvim Config

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
	local out = vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'--branch=stable',
		lazyrepo,
		lazypath,
	})
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
			{ out, 'WarningMsg' },
			{ '\nPress any key to exit...' },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)

---@module "lazy"
---@type LazyPluginSpec
local spec = {
	{
		'fedepujol/cosmos.nvim',
		lazy = false,
		dev = true,
		config = function()
			vim.cmd('color cosmos')
		end,
	},
	{
		'fedepujol/move.nvim',
		cmd = {
			'MoveLine',
			'MoveBlock',
			'MoveWord',
		},
		keys = {
			{ '<A-j>', ':MoveLine(1)<CR>', { desc = 'Line Down' } },
			{ '<A-k>', ':MoveLine(-1)<CR>', { desc = 'Line Up' } },
			{ mode = 'v', '<A-j>', ':MoveBlock(1)<CR>', { desc = 'Block Down' } },
			{ mode = 'v', '<A-k>', ':MoveBlock(-1)<CR>', { desc = 'Block Up' } },
		},
		opts = {
			char = {
				enable = true,
			},
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
	{
		'mfussenegger/nvim-jdtls',
		ft = 'java',
		dependencies = {
			'mfussenegger/nvim-dap',
		},
	},
	{ import = 'plugins' },
}

---@module "lazy"
---@type LazyConfig
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
vim.keymap.set('n', '<leader>ul', ':Lazy<CR>', { desc = '[l]azy' })
