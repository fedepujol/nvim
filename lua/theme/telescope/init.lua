-- Telescope ColorScheme
vim.api.nvim_exec([[
    hi TelescopeSelection       guifg=#D79921 gui=bold
    hi TelescopeSelectionCaret  guifg=#31A835
    hi TelescopeMultiSelection  guifg=#928374
    hi NonText                  guifg=#FFFFFF
]], false)

-- Border Highlight
vim.api.nvim_exec([[
    hi TelescopeBorder          guifg=#69D36B
    hi TelescopePromptBorder    guifg=#69D36B
    hi TelescopeResultsBorder   guifg=#69D36B
    hi TelescopePreviewBorder   guifg=#69D36B
]], false)