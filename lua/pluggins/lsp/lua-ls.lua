-- Lua LSP
local lsp = require('pluggins.lsp')
local system_name
local sumneko_root_path = ""
local sumneko_binary = ""

if vim.fn.has("mac") == 1 then
	system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
	system_name = "Linux"
elseif vim.fn.has("win32") == 1 then
	system_name = "Windows"
else
	print("Unsupported system")
end

sumneko_root_path = lsp.lsp_dir..'/sumneko_lua'
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
}

