return {
	'stevearc/conform.nvim',
	event = "LspAttach",
	config = function()
		require("conform").setup({
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true
			},
			formatters_by_ft = {
				css = { "prettierd" },
				lua = { "stylua" },
				markdown = { "prettierd" },
				javascript = { "prettierd" },
				rust = { "rustfmt" },
				yaml = { "yamlfmt" }
			},
		})
	end
}
