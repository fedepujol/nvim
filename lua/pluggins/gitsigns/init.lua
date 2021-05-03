-- GitSigns
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│' },
    change       = {hl = 'GitSignsChange', text = '│' },
    delete       = {hl = 'GitSignsDelete', text = '>' },
    topdelete    = {hl = 'GitSignsDelete', text = '‾' },
    changedelete = {hl = 'GitSignsChange', text = '~' },
  },
  numhl = false,
  linehl = false,
  watch_index = {
    interval = 1000
  },
  current_line_blame = false,
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  use_decoration_api = true,
}

vim.api.nvim_exec([[
    hi GitSignsAdd    guibg=#36B739 guifg=#262626
    hi GitSignsChange guibg=#EB9800 guifg=#262626 
    hi GitSignsDelete guibg=#890000 guifg=#262626 
]], false)
