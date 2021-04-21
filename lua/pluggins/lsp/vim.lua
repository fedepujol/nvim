-- Vim LSP
-- npm i -g vim-language-server
require 'lspconfig'.vimls.setup{
    init_options = {
        diagnostic = {
            enable = true
        }
    }
}