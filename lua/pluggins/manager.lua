-- Setting Paq

-- Paq Init
require('paq') {
	'savq/paq-nvim';

	-- Lsp
	'neovim/nvim-lspconfig';
	'kabouzeid/nvim-lspinstall';
	'glepnir/lspsaga.nvim';

	-- Icons
	'kyazdani42/nvim-web-devicons';

	-- Colorschemes
	'fedepujol/fpcolor';

	-- Buffer Bar
	'romgrk/barbar.nvim';

	-- Hex/RGB/Color Handler
	'norcalli/nvim-colorizer.lua';

	-- Completion
	'hrsh7th/nvim-cmp';
	'hrsh7th/cmp-buffer';
	'hrsh7th/cmp-nvim-lua';
	'hrsh7th/cmp-nvim-lsp';
	'hrsh7th/cmp-path';
	'hrsh7th/vim-vsnip';

	-- AutoPairs
	'windwp/nvim-autopairs';

	-- Treesitter
	{'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'};
	'nvim-treesitter/playground';

	-- StatusLine
	{'glepnir/galaxyline.nvim', branch = 'main'};

	-- Search/FZF
	'nvim-lua/plenary.nvim';
	'nvim-lua/popup.nvim';
	'nvim-telescope/telescope.nvim';

	-- Code Versioning
	'lewis6991/gitsigns.nvim';

	-- Comment
	'b3nj5m1n/kommentary';

	-- File Explorer
	'kyazdani42/nvim-tree.lua';

	-- WhichKey
	'folke/which-key.nvim';

	-- Terminal
	'akinsho/nvim-toggleterm.lua';

	-- UI
	'MunifTanjim/nui.nvim';
}
