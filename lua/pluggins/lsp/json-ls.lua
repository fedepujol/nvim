-- JSON LSP
-- npm i -g vscode-json-languageserver
local lsp = require('pluggins.lsp')

require 'lspconfig'.jsonls.setup {
	cmd = {'node',  lsp.data_dir..'/json/vscode-json/json-language-features/server/dist/node/jsonServerMain.js', '--stdio'},
	root_dir = require('lspconfig/util').root_pattern{'.git', vim.fn.getcwd()},
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({}, {0,0}, {vim.fn.line("$"), 0})
        end
      }
    }
}
