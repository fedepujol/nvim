---@module "lazy"
---@type LazyPluginSpec
return {
	'stevearc/conform.nvim',
	event = 'LspAttach',
	config = function()
		require('conform').setup({
			format_on_save = {
				timeout_ms = 500,
				lsp_format = 'fallback',
			},
			formatters_by_ft = {
				c = { 'clang-format' },
				css = { 'prettierd' },
				-- Requires Java v17+
				java = { 'google-java-format' },
				javascript = { 'prettierd' },
				-- nixpkgs-fmt was deprecated
				nix = { 'nixfmt' },
				lua = { 'stylua' },
				rust = { 'rustfmt' },
				yaml = { 'yamlfmt' },
			},
		})
	end,
}
