-- Vim LSP
-- npm i -g vim-language-server
local lsp = require('plugins.lsp.config')

require('lspconfig').vimls.setup {
	cmd = { lsp.dir..'/vim/node_modules/.bin/vim-language-server'..lsp.prefix(), '--stdio' },
	on_attach = lsp.common_on_attach,
    init_options = {
        diagnostic = {
            enable = true
        }
    },
	capabilities = lsp.capabilities
}
