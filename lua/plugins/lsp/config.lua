-- Lsp Config
local M = {}

-- Mappings
local key_opts = { noremap = true, silent = true }
vim.keymap.set('n', 'dl', vim.diagnostic.open_float, key_opts)
vim.keymap.set('n', 'dp', vim.diagnostic.goto_prev, key_opts)
vim.keymap.set('n', 'dn', vim.diagnostic.goto_next, key_opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, key_opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
M.on_attach = function(_, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', 'sh', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set('n', 'D', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', 'rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', 'ca', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
end

local border = {
	{ '╭', 'FloatBorder' },
	{ '─', 'FloatBorder' },
	{ '╮', 'FloatBorder' },
	{ '│', 'FloatBorder' },
	{ '╯', 'FloatBorder' },
	{ '─', 'FloatBorder' },
	{ '╰', 'FloatBorder' },
	{ '│', 'FloatBorder' },
}

-- Handlers
vim.lsp.diagnostic.config = {
	virtual_text = true,
	signs = true,
	underline = true,
	update_on_insert = false,
	source = 'always',
	severity_sort = false,
	float = {
		source = 'always',
	},
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or border
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local function getOS()
	local system_name = ''
	if vim.fn.has('mac') == 1 then
		system_name = 'macOS'
	elseif vim.fn.has('unix') == 1 then
		system_name = 'Linux'
	else
		system_name = 'Windows'
	end
	return system_name
end

M.isOS = function(target)
	local os = getOS()
	return os ~= '' and os:lower() == target
end

M.prefix = function()
	local osPrefix = ''
	if M.isOS('windows') then
		osPrefix = '.cmd'
	end
	return osPrefix
end

M.dir = vim.fn.stdpath('data') .. '/lsp_servers'

M.root_pattern = require('lspconfig.util').root_pattern

M.build_config = function()
	return {
		on_attach = M.on_attach,
		root_pattern = M.root_pattern,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150
		}
	}
end

return M
