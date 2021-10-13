-- Null-ls
-- Performance goes to shit
local null_ls = require('null-ls')

local tslint = {
	method = null_ls.methods.DIAGNOSTICS,
	filetypes = { 'typescript' },
	generator = null_ls.generator({
		command = 'tslint',
		to_stdin = true,
		from_stderr = true,
		format = 'json',
		args = { '-t', 'json', '-p', vim.fn.getcwd() ,'$FILENAME' },
		on_output = function(params)
			local diagnostics = {}
			for _, value in ipairs(params.output) do
				local diagnostic = {
					col = value.startPosition.character + 1,
					row = value.startPosition.line + 1,
					end_col = value.endPosition.character + 1,
					end_row = value.endPosition.line + 1,
					message = value.failure,
					severity = 2
				}
				table.insert(diagnostics, diagnostic)
			end
			return diagnostics
		end,
	})
}

null_ls.config({ debug = true })
null_ls.register(tslint)

require('lspconfig')['null-ls'].setup({
	on_attach = require('plugins.lsp.config').common_on_attach
})
