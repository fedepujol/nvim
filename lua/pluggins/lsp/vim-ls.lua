-- Vim LSP
-- npm i -g vim-language-server
local lsp = require('pluggins.lsp')

local cmd = '/vim/node_modules/.bin/vim-language-server'
if lsp.is_windows() then
	cmd = cmd..'.cmd'
end

require('lspconfig').vimls.setup {
	cmd = {lsp.dir..cmd, '--stdio'},
	on_attach = lsp.common_on_attach,
    init_options = {
        diagnostic = {
            enable = true
        }
    },
	capabilities = lsp.capabilities
}
