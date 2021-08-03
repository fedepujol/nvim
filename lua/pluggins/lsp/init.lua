-- LSP Config
local opts = {noremap = true, silent = true}

vim.api.nvim_set_keymap('n', 'H', '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>ds', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>t', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
vim.api.nvim_set_keymap('n', 'sh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
vim.api.nvim_set_keymap('n', 'dn', '<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts = {border = "single"}})<CR>', opts)
vim.api.nvim_set_keymap('n', 'dp', '<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = "single"}})<CR>', opts)

vim.cmd("sign define LspDiagnosticsSignHint numhl= text=H linehl=")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		underline = false,
		virtual_text = false,
		signs = true,
	}
)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
	vim.lsp.handlers.hover, {
		border = 'single'
	}
)

vim.lsp.protocol.CompletionItemKind = {
	" (text)",
    " (method)",
    " (function)",
    "襁 (constructor)",
    " (field)",
    " (variable)",
    " (class)",
    "壟(interface)",
    " (module)",
    " (property)",
    " (unit)",
    " (value)",
    " (enum)",
    " (keyword)",
    " (snippet)",
    " (color)",
    " (file)",
    " (reference)",
    " (folder)",
    "ﱔ (enummember)",
    " (constant)",
    "ﴰ (struct)",
    " (event)",
    "駱 (operator)",
    " (typeparameter)"
}


local function documentHighlight(client, bufnr)
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

local lsp_config = {
	lsp_dir = vim.fn.stdpath('data')..'/lspinstall',
	root_pattern = require('lspconfig/util').root_pattern
}

function lsp_config.common_on_attach(client, bufnr)
	documentHighlight(client, bufnr)
end

return lsp_config
