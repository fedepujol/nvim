-- formatter.nvim
return {
	'mhartington/formatter.nvim',
	config = function()
		local util = require('formatter.util')
		local filetypes = require('formatter.filetypes')

		require('formatter').setup({
			logging = true, -- Enable logging
			log_level = vim.log.levels.WARN, -- Log level
			filetype = { -- Formatter configurations are opt-in
				lua = {
					filetypes.lua.stylua,
					function()
						return {
							exe = 'stylua',
							args = {
								'--search-parent-directories',
								'--stdin-filepath',
								util.escape_path(util.get_current_buffer_file_path()),
								'--',
								'-',
							},
							stdin = true,
						}
					end,
				},
				html = {
					filetypes.html.htmlbeautify,
					function()
						return {
							exe = 'html-beautify',
							args = {
								'-f',
								util.escape_path(util.get_current_buffer_file_path()),
								'--type',
								'html',
								'-s',
								'2',
							},
							stdin = true,
						}
					end,
				},
				css = {
					filetypes.css.cssbeautify,
					function()
						return {
							exe = 'css-beautify',
							args = {
								'-f',
								util.escape_path(util.get_current_buffer_file_path()),
								'--type',
								'css',
								'-s',
								'2',
							},
							stdin = true,
						}
					end,
				}
			},
		})
	end
}
