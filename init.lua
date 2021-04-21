-- General Configs
require('pluggins.settings')
require('general.settings')
require('general.mappings')
require('pluggins.manager')

-- Plugins
require('pluggins.barbar')
require('pluggins.colorizer')
require('pluggins.compe')
require('pluggins.lsp')
require('pluggins.lspsaga')
require('pluggins.treesitter')
require('pluggins.galaxyline.galaxy-line')

-- LSP
require('lsp.bash')
require('lsp.css')
require('lsp.json')
require('lsp.pyright')
require('lsp.tsserver')
require('lsp.vim')
require('lsp.yaml')

vim.loop.spawn = (
  function ()
    local spawn = vim.loop.spawn
    return function(path, options, on_exit)
      local full_path = vim.fn.exepath(path)
      return spawn(full_path, options, on_exit)
    end
  end)()