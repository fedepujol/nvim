-- Lua LSP
local lsp = require('plugins.lsp.config')
local sumneko_root_path = ''
local sumneko_binary = ''

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

sumneko_root_path = lsp.dir .. '/sumneko_lua/extension/server'
sumneko_binary = sumneko_root_path .. '/bin/lua-language-server'

require('lspconfig').sumneko_lua.setup({
	cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' },
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which versin of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
				-- Setup your lua path
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the 'vim' global
				globals = { 'vim' },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file('', true),
			},
			-- Do not send telemetry data
			telemetry = {
				enable = false,
			},
		},
	},
	on_attach = lsp.on_attach,
	capabilities = lsp.capabilities,
	handlers = lsp.handlers,
})
