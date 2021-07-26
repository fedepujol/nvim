-- Autopairs setup

require('nvim-autopairs').setup{
	check_ts = true
}

require('nvim-autopairs.completion.compe').setup{
	map_cr = true, -- map <CR> on insert mode
	map_complete = true -- it will auto insert '(' after select function or method
}
