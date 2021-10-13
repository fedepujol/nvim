-- Mappings
local opts = {noremap = true, silent = true}

vim.api.nvim_set_keymap('n', 'H', '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>ds', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>t', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
vim.api.nvim_set_keymap('n', 'sh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
vim.api.nvim_set_keymap('n', 'dn', '<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts = {border = "single"}})<CR>', opts)
vim.api.nvim_set_keymap('n', 'dp', '<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = "single"}})<CR>', opts)

