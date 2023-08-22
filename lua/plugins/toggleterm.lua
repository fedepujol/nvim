-- ToggleTerma Setup

return {
	'akinsho/nvim-toggleterm.lua',
	cmd = "ToggleTerm",
	opts = {
		size = 17,
		hide_numbers = true,
		start_in_insert = false,
		direction = 'horizontal', -- vertical | float | tab
		persist_size = true,
		close_on_exit = true,
		open_mapping = '\\tc',
		insert_mapping = false
	}
}
