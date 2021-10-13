-- Lua LSP
local lsp = require('plugins.lsp.config')
local system_name
local sumneko_root_path = ""
local sumneko_binary = ""

if lsp.isOS('macos') then
	system_name = 'macOS'
elseif lsp.isOS('linux') then
	system_name = 'Linux'
elseif lsp.isOS('windows') then
	system_name = 'Windows'
else
	print('Unsupported')
end

sumneko_root_path = lsp.dir..'/sumneko_lua/extension/server'
sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

require('lspconfig').sumneko_lua.setup{
	cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which versin of Lua you're using (most likely LuaJIT in the case of Neovim)
	 			version = 'LuaJIT',
	 			-- Setup your lua path
	 			path = vim.split(package.path, '.')
	 		},
			diagnostics = {
				-- Get the language server to recognize the 'vim' global
				globals = {'vim'}
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
				},
			},
			-- Do not send telemetry data
			telemetry = {
				enable = false,
			},
	 	},
	},
	capabilities = lsp.capabilities
}

