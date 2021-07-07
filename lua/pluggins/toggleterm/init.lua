-- ToggleTerma Setup
require('toggleterm').setup{
	size = 20,
	hide_numbers = true,
	start_in_insert = false,
	direction = 'horizontal',
	persist_size = true,
	close_on_exit = true,
}

vim.api.nvim_set_keymap('n', '<leader>t', "<cmd>exe v:count1 . 'ToggleTerm'<CR>", {noremap = true, silent = true})
