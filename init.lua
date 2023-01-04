-- General bootstrap
require('core')

if vim.g.neovide ~= nil then
	vim.opt.guifont = 'Fira Code:h11'
	vim.g.neovide_confirm_quit = true
	vim.g.neovide_rememeber_window_size = false
	vim.g.neovide_cursor_animation_length = 0
	vim.g.neovide_cursor_trail_size = 0
end
