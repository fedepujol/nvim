-- ToggleTerma Setup

return {
	'akinsho/nvim-toggleterm.lua',
	cmd = 'ToggleTerm',
	config = function()
		local utils = require('utils')
		local custom_shell = vim.o.shell

		if utils.is_windows() then
			custom_shell = 'bash'
		end

		local toggleterm = require('toggleterm')
		toggleterm.setup({
			start_in_insert = false,
			direction = 'tab', -- vertical | float | tab
			open_mapping = '<leader>to',
			insert_mapping = false,
			-- shell = custom_shell,
		})

		vim.keymap.set('n', '<leader>tt', toggleterm.toggle, { desc = '[t]erminal [t]oggle' })
		vim.keymap.set('n', '<leader>ts', ':TermSelect<CR>', { desc = '[t]erminal [s]elect' })
		vim.keymap.set('n', '<leader>to', toggleterm.new, { desc = '[t]erminal [o]pen' })
	end,
}
