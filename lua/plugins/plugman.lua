-- Setting Paq
local install_path = vim.fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({
		'git',
		'clone',
		'--depth=1',
		'https://github.com/savq/paq-nvim.git',
		install_path,
	})
end

-- Paq Init
require('paq')({
	'savq/paq-nvim',

	-- Lsp
	'j-hui/fidget.nvim',
	'mfussenegger/nvim-dap',
	'mfussenegger/nvim-jdtls',
	'mfussenegger/nvim-lint',
	'mhartington/formatter.nvim',
	'neovim/nvim-lspconfig',
	'weilbith/nvim-code-action-menu',
	'williamboman/nvim-lsp-installer',
	'jose-elias-alvarez/null-ls.nvim';

	-- Icons
	'kyazdani42/nvim-web-devicons',

	-- Colors
	'fedepujol/nv-themes',
	'norcalli/nvim-colorizer.lua',
	'rktjmp/lush.nvim',
	'rktjmp/shipwright.nvim',

	-- Completion
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-nvim-lsp-document-symbol',
	'hrsh7th/cmp-nvim-lsp-signature-help',
	'hrsh7th/cmp-nvim-lua',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-vsnip',
	'hrsh7th/nvim-cmp',
	'hrsh7th/vim-vsnip',
	'mattn/emmet-vim',

	-- UI Components
	'MunifTanjim/nui.nvim',
	'akinsho/nvim-toggleterm.lua',
	'nvim-neo-tree/neo-tree.nvim',
	'rebelot/heirline.nvim',
	'romgrk/barbar.nvim',
	'stevearc/dressing.nvim',

	-- Search/FZF
	'nvim-lua/plenary.nvim',
	'nvim-lua/popup.nvim',
	'nvim-telescope/telescope.nvim',
	{ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },

	-- Git Integration
	'lewis6991/gitsigns.nvim',
	'sindrets/diffview.nvim',

	-- Treesitter
	{ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
	'nvim-treesitter/playground',
	'p00f/nvim-ts-rainbow',

	-- Editor Functionality
	'abecodes/tabout.nvim',
	'fedepujol/move.nvim',
	'mg979/vim-visual-multi',
	'numToStr/Comment.nvim',
	'windwp/nvim-autopairs',

	-- Keys
	'folke/which-key.nvim',
	'max397574/better-escape.nvim',
})
