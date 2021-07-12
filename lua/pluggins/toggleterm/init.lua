-- ToggleTerma Setup
require('toggleterm').setup{
	size = 12,
	hide_numbers = true,
	start_in_insert = false,
	direction = 'horizontal',
	persist_size = true,
	close_on_exit = true,
	shell = "bash"
}

vim.api.nvim_set_keymap('n', '<leader>t', "<cmd>:ToggleTerm<CR>", {noremap = true, silent = true})
