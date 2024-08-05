return {
	'stevearc/conform.nvim',
	event = 'LspAttach',
	config = function()
		require('conform').setup({
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				css = { 'prettierd' },
				javascript = { 'prettierd' },
				lua = { 'stylua' },
				markdown = { 'markdownlint' },
				rust = { 'rustfmt' },
				xml = { 'xmlformatter' },
				yaml = { 'yamlfmt' },
			},
		})
	end,
}
