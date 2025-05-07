-- ToggleTerma Setup

return {
	'akinsho/nvim-toggleterm.lua',
	cmd = "ToggleTerm",
	config = function()
		local toggleterm = require('toggleterm')
		toggleterm.setup({
			size = 17,
			hide_numbers = true,
			start_in_insert = false,
			direction = 'horizontal', -- vertical | float | tab
			persist_size = true,
			close_on_exit = true,
			open_mapping = '\\tc',
			insert_mapping = false
		})

		vim.keymap.set('n', '<leader>tt', toggleterm.toggle, { desc = "[t]erminal [t]oggle" })
		vim.keymap.set('n', '<leader>ts', ":TermSelect<CR>", { desc = "[t]erminal [s]elect" })
	end
}
