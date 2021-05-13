local saga = require 'lspsaga'

saga.init_lsp_saga{
    error_sign = '',
    warn_sign = '',
    hint_sign = 'W',
    infor_sign = ''
}

local opts = {noremap = true, silent = true}

-- Lsp Finder (find cursor word definition and reference)
vim.api.nvim_set_keymap('n', 'gh', ':Lspsaga lsp_finder<CR>', opts)

-- Code Actions (Organize imports, import missing libraries, etc)
vim.api.nvim_set_keymap('n', '<leader>ca', ':Lspsaga code_action<CR>', opts)
vim.api.nvim_set_keymap('v', '<leader>ra', ':<C-U>Lspsaga range_code_action<CR>', opts)

-- Hover (show documentation and scroll)
vim.api.nvim_set_keymap('n', 'H', ':Lspsaga hover_doc<CR>', opts)
vim.api.nvim_set_keymap('n', '<M-f>', "<Cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)
vim.api.nvim_set_keymap('n', '<M-b>', "<Cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts)

-- Signature (Show Signature Help)
vim.api.nvim_set_keymap('n', 'gs', ':Lspsaga signature_help<CR>', opts)

-- Diagnostics
vim.api.nvim_set_keymap('n', '<leader>cd', ':Lspsaga show_line_diagnostics<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-n>', "<CMD>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_next()<CR>", opts)
vim.api.nvim_set_keymap('n', '<C-m>', "<CMD>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_prev()<CR>", opts)
