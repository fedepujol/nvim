-- LSP Config
local opts = {noremap = true, silent = true}

vim.api.nvim_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>D', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>f', '<Cmd>lua vim.lsp.buf.formatting()<CR>', opts)

vim.cmd("sign define LspDiagnosticsSignHint numhl= text=H linehl=")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		underline = true,
		virtual_text = {
			prefix = '',
			spacing = 4
		},
		signs = true,
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
