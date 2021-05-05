-- LSP Config
local opts = {noremap = true, silent = true}

vim.api.nvim_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>D', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
vim.api.nvim_set_keymap('n', '<S-M-f>', '<Cmd>lua vim.lsp.buf.formatting()<CR>', opts)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		underline = true,
		virtual_text = {
			prefix = '',
			spacing = 2
		},
		signs = true,
	}
)

vim.lsp.protocol.CompletionItemKind = {
	" (text)",
    " (method)",
    " (function)",
    " (constructor)",
    " (field)",
    " (variable)",
    "C (class)",
    "I (interface)",
    "m (module)",
    " (property)",
    "U (unit)",
    " (value)",
    " (enum)",
    " (keyword)",
    " (snippet)",
    " (color)",
    " (file)",
    "壟(reference)",
    " (folder)",
    " (enummember)",
    " (constant)",
    "ﳤ (struct)",
    " (event)",
    " (operator)",
    "<T> (typeparameter)"
}
