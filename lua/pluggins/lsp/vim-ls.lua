-- Vim LSP
-- npm i -g vim-language-server
local lsp = require('pluggins.lsp.config')

local cmd = '/vim'
if lsp.isOS('windows') then
	cmd = cmd..'/vim-language-server.cmd'
elseif lsp.isOS('linux') then
	cmd = cmd..'/node_modules/.bin/vim-language-server'
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
