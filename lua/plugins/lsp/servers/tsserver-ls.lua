-- TSServer LSP
-- npm i -g typescript typescript-language-server
local lsp = require('plugins.lsp.config')

local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = ""
	}
	vim.lsp.buf.execute_command(params)
end

require('lspconfig').tsserver.setup{
	cmd = { lsp.dir..'/tsserver/node_modules/.bin/typescript-language-server'..lsp.prefix(), '--stdio' },
	on_attach = lsp.common_on_attach,
	handlers = {
		["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			virtual_text = true,
			underline = true,
			update_in_insert = true,
		})
	},
	capabilities = lsp.capabilities,
	commands = {
		OrganizeImports = {
			organize_imports,
			description = "Organize Imports"
		}
	}
}
