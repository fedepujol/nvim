-- Settings Paq

-- Paq Init
vim.cmd 'packadd paq-nvim'
local paq = require 'paq-nvim'.paq
paq {'savq/paq-nvim', opt = true}

-- Lsp
paq {'neovim/nvim-lspconfig'}
paq {'glepnir/lspsaga.nvim'}
paq {'kabouzeid/nvim-lspinstall'}

-- Icons
paq {'kyazdani42/nvim-web-devicons'}

-- Buffer Bar (Find a better replace/write one)
paq {'romgrk/barbar.nvim'}

-- Hex/RGB/Color Handler
paq {'norcalli/nvim-colorizer.lua'}

-- Completion
paq {'hrsh7th/nvim-compe'}
paq {'hrsh7th/vim-vsnip'}

-- Colors
paq {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

-- StatusLine
paq {'glepnir/galaxyline.nvim', branch = 'main'}

-- Search/FZF
paq {'nvim-lua/plenary.nvim'}
paq {'nvim-lua/popup.nvim'}
paq {'nvim-telescope/telescope.nvim'}

-- Code Versioning

-- File Explorer
paq {'kyazdani42/nvim-tree.lua'}
