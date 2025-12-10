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
				-- java = { 'google-java-format' },
				javascript = { 'prettierd' },
				nix = { 'nixfmt' },
				lua = { 'stylua' },
				rust = { 'rustfmt' },
				sh = { 'shfmt' },
				yaml = { 'yamlfmt' },
			},
		})
	end,
}
