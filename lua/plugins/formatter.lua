-- formatter.nvim
return {
	'mhartington/formatter.nvim',
	cmd = { 'Format' },
	config = function()
		local filetypes = require('formatter.filetypes')

		require('formatter').setup({
			logging = true,         -- Enable logging
			log_level = vim.log.levels.WARN, -- Log level
			filetype = {
				-- Formatter configurations are opt-in
				css = {
					filetypes.css.prettierd
				},
				lua = {
					filetypes.lua.stylua,
				},
				markdown = {
					filetypes.markdown.prettierd
				},
				rust = {
					filetypes.rust.rustfmt
				},
				yaml = {
					filetypes.yaml.yamlfmt
				}
			},
		})
	end
}
