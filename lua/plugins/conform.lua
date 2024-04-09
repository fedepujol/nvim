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
				lua = { 'stylua' },
				markdown = { 'markdownlint' },
				javascript = { 'prettierd' },
				java = { 'google-java-format' },
				rust = { 'rustfmt' },
				yaml = { 'yamlfmt' },
				xml = { 'xmlformatter' },
			},
		})
	end,
}
