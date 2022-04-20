-- Setting Paq

local install_path = vim.fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({ 'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_path })
end

-- Paq Init
require('paq')({
	'savq/paq-nvim',

	-- Lsp
	'neovim/nvim-lspconfig',
	'williamboman/nvim-lsp-installer',
	'jose-elias-alvarez/null-ls.nvim',
	'j-hui/fidget.nvim',
	'weilbith/nvim-code-action-menu',

	-- Icons
	'kyazdani42/nvim-web-devicons',

	-- Colors
	'norcalli/nvim-colorizer.lua',
	'rktjmp/lush.nvim',
	'rktjmp/shipwright.nvim',
	'fedepujol/nv-themes',

	-- Completion
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-nvim-lua',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-vsnip',
	'hrsh7th/vim-vsnip',
	'hrsh7th/cmp-nvim-lsp-document-symbol',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/cmp-nvim-lsp-signature-help',
	'mattn/emmet-vim',

	-- UI Components
	'rebelot/heirline.nvim',
	{ 'romgrk/barbar.nvim', branch = 'v2.x' },
	'nvim-neo-tree/neo-tree.nvim',
	'akinsho/nvim-toggleterm.lua',
	'MunifTanjim/nui.nvim',
	'stevearc/dressing.nvim',

	-- Search/FZF
	'nvim-lua/plenary.nvim',
	'nvim-lua/popup.nvim',
	'nvim-telescope/telescope.nvim',
	{ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },

	-- Git Integration
	'lewis6991/gitsigns.nvim',

	-- Treesitter
	{ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
	'nvim-treesitter/playground',
	'p00f/nvim-ts-rainbow',

	-- Editor Functionality
	'numToStr/Comment.nvim',
	'windwp/nvim-autopairs',
	'abecodes/tabout.nvim',
	'fedepujol/move.nvim',
	'mg979/vim-visual-multi',

	-- Keys
	'folke/which-key.nvim',
	'max397574/better-escape.nvim',
})
