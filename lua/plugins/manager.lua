-- Setting Paq

-- Paq Init
require('paq') {
	'savq/paq-nvim';

	-- Lsp
	'neovim/nvim-lspconfig';
	'williamboman/nvim-lsp-installer';
	{'tami5/lspsaga.nvim', branch = 'nvim51'};

	-- Icons
	'kyazdani42/nvim-web-devicons';

	-- Colors
	'norcalli/nvim-colorizer.lua';
	'rktjmp/lush.nvim';
	'fedepujol/nv-themes';

	-- Completion
	'hrsh7th/nvim-cmp';
	'hrsh7th/cmp-buffer';
	'hrsh7th/cmp-nvim-lua';
	'hrsh7th/cmp-nvim-lsp';
	'hrsh7th/cmp-path';
	'hrsh7th/cmp-vsnip';
	'hrsh7th/vim-vsnip';

	-- UI Components
	'famiu/feline.nvim';
	'romgrk/barbar.nvim';
	'kyazdani42/nvim-tree.lua';
	'akinsho/nvim-toggleterm.lua';

	-- Search/FZF
	'nvim-lua/plenary.nvim';
	'nvim-lua/popup.nvim';
	'nvim-telescope/telescope.nvim';

	-- Git Integration
	'lewis6991/gitsigns.nvim';

	-- Treesitter
	{'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'};
	'nvim-treesitter/playground';
	'p00f/nvim-ts-rainbow';

	-- Editor Functionality
	'numToStr/Comment.nvim';
	'windwp/nvim-autopairs';
	'abecodes/tabout.nvim';
	'fedepujol/move.nvim';

	-- Keys
	'folke/which-key.nvim';
	'max397574/better-escape.nvim';
}
