-- Setting Paq

-- Paq Init
require('paq') {
	'savq/paq-nvim';

	-- Lsp
	'neovim/nvim-lspconfig';
	'williamboman/nvim-lsp-installer';

	-- Icons
	'kyazdani42/nvim-web-devicons';

	-- Colorschemes
	'fedepujol/nv-themes';

	-- Buffer Bar
	'romgrk/barbar.nvim';

	-- Hex/RGB/Color Handler
	'norcalli/nvim-colorizer.lua';
	'rktjmp/lush.nvim';

	-- Completion
	'hrsh7th/nvim-cmp';
	'hrsh7th/cmp-buffer';
	'hrsh7th/cmp-nvim-lua';
	'hrsh7th/cmp-nvim-lsp';
	'hrsh7th/cmp-path';
	'hrsh7th/cmp-vsnip';
	'hrsh7th/vim-vsnip';

	-- AutoPairs
	'windwp/nvim-autopairs';

	-- Treesitter
	{'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'};
	'nvim-treesitter/playground';

	-- StatusLine
	'famiu/feline.nvim';

	-- Search/FZF
	'nvim-lua/plenary.nvim';
	'nvim-lua/popup.nvim';
	'nvim-telescope/telescope.nvim';

	-- Git Integration
	'lewis6991/gitsigns.nvim';

	-- Comment
	'numToStr/Comment.nvim';

	-- File Explorer
	'kyazdani42/nvim-tree.lua';

	-- Key Mappings
	'folke/which-key.nvim';
	'max397574/better-escape.nvim';

	-- Terminal
	'akinsho/nvim-toggleterm.lua';

	-- Misc
	'fedepujol/move.nvim';
}
