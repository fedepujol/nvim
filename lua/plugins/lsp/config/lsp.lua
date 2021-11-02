-- LSP Config
Lsp = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local function documentHighlight(client, _)
    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
			hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
			hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
			hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
			augroup lsp_document_highlight
				autocmd! * <buffer>
				autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
				autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
			augroup END
		]], false)
    end
end

local function getOS()
	local system_name = ''
	if vim.fn.has("mac") == 1 then
		system_name = "macOS"
	elseif vim.fn.has("unix") == 1 then
		system_name = "Linux"
	elseif vim.fn.has("win32") == 1 then
		system_name = "Windows"
	else
		print("Unsupported system")
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

Lsp.common_on_attach = function(client, bufnr)
	documentHighlight(client, bufnr)
end

Lsp.dir = vim.fn.stdpath('data')..'/lsp_servers'

Lsp.root_pattern = require('lspconfig/util').root_pattern

Lsp.capabilities = capabilities

return Lsp
