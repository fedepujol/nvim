vim.cmd([[autocmd ColorScheme * highlight FloatBorder guifg=white]])

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

local handlers = {
	['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = border,
	}),

	['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = border,
	}),
}

return handlers
