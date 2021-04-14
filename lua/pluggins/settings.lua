-- Setting Paq

vim.cmd 'packadd paq-nvim'
local paq = require 'paq-nvim'.paq
paq {'paq-nvim', opt = true}

paq {'neovim/nvim-lspconfig'}
paq {'glepnir/lspsaga.nvim'}
paq {'kyazdani42/nvim-web-devicons'}
paq {'romgrk/barbar.nvim'}
paq {'norcalli/nvim-colorizer.lua'}
paq {'hrsh7th/nvim-compe'}
paq {'hrsh7th/vim-vsnip'}
paq {'nvim-treesitter/nvim-treesitter'}