-- Vim LSP
-- npm i -g vim-language-server
local lsp = require('pluggins.lsp')

require('lspconfig').vimls.setup{
	cmd = {lsp.lsp_dir..'/vim/vim-language-server.cmd', '--stdio'},
	on_attach = lsp.common_on_attach,
    init_options = {
        diagnostic = {
            enable = true
        }
    }
}
