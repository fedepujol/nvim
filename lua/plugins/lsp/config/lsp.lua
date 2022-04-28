-- LSP Config
Lsp = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local function getOS()
	local system_name = ''
	if vim.fn.has('mac') == 1 then
		system_name = 'macOS'
	elseif vim.fn.has('unix') == 1 then
		system_name = 'Linux'
	elseif vim.fn.has('win32') == 1 then
		system_name = 'Windows'
	else
		print('Unsupported system')
	end
	return system_name
end

Lsp.isOS = function(target)
	local os = getOS()
	return os ~= '' and os:lower() == target
end

Lsp.prefix = function()
	local osPrefix = ''
	if Lsp.isOS('windows') then
		osPrefix = '.cmd'
	end
	return osPrefix
end

Lsp.on_attach = function(_, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local function buf_set_options(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_options('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings
	local opts = { noremap = true, silent = true }

	buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', 'sh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap('n', 'D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_set_keymap('n', 'ca', ':CodeActionMenu<CR>', opts)
	buf_set_keymap('n', 'dr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', 'dl', '<cmd>lua vim.diagnostic.open_float(0, { scope = "line", border = "single" })<CR>', opts)
	buf_set_keymap('n', 'dn', '<cmd>lua vim.diagnostic.goto_next({ float = { border = "single" }})<CR>', opts)
	buf_set_keymap('n', 'dp', '<cmd>lua vim.diagnostic.goto_prev({ float = { border = "single" }})<CR>', opts)
	buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
end

Lsp.dir = vim.fn.stdpath('data') .. '/lsp_servers'

Lsp.root_pattern = require('lspconfig.util').root_pattern

Lsp.capabilities = capabilities

Lsp.handlers = require('plugins.lsp.config.handler')

return Lsp
