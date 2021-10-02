-- JSON LSP
-- npm i -g vscode-json-languageserver
local lsp = require('pluggins.lsp.config')

require 'lspconfig'.jsonls.setup {
	cmd = { lsp.dir..'/vscode-langservers-extracted/node_modules/.bin/vscode-json-language-server'..lsp.prefix(), '--stdio' },
	on_attach = lsp.common_on_attach,
	root_dir = require('lspconfig/util').root_pattern{'.git', vim.fn.getcwd()},
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({}, {0,0}, {vim.fn.line("$"), 0})
        end
      }
    }
}
