local border = {
	{ "╭", "Normal"},
	{ "─", "Normal"},
	{ "╮", "Normal"},
	{ "│", "Normal"},
	{ "╯", "Normal"},
	{ "─", "Normal"},
	{ "╰", "Normal"},
	{ "│", "Normal"}
}
-- Handlers
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		underline = false,
		virtual_text = {
			source = 'always',
		},
		signs = true,
	}
)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
	vim.lsp.handlers.hover, {
		border = border
	}
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
	vim.lsp.handlers.signature_help, {
		border = border
	}
)
