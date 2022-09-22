-- formatter.nvim
local util = require('formatter.util')

require('formatter').setup({
	logging = true, -- Enable logging
	log_level = vim.log.levels.WARN, -- Log level
	filetype = { -- Formatter configurations are opt-in
		lua = {
			require('formatter.filetypes.lua').stylua,
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
	},
})
