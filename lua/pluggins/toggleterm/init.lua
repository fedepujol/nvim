-- ToggleTerma Setup
require('toggleterm').setup{
	size = 15,
	hide_numbers = true,
	start_in_insert = false,
	direction = 'horizontal', -- vertical | float | window
	persist_size = true,
	close_on_exit = true,
	shell = "bash",
	float_opts = {
		border = "rounded",
		width = 150,
		height = 40,
		winblend = 3,
		highlights = {
			border = "Normal",
			background = "Normal"
		}
	}
}

vim.api.nvim_set_keymap('n', '<leader>t', "<cmd>:ToggleTerm<CR>", {noremap = true, silent = true})
