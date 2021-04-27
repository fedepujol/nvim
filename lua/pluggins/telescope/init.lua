-- Telescope
require('telescope').setup{
	defaults = {
		vimgrep_arguments = {
			'rg',
			'--color=never',
			'--with-filename',
			'--line-number',
			'--column',
			'--smart-case'
		},
		prompt_position = 'top',
		prompt_prefix = '~ ',
		selection_caret = '> ',
		sorting_strategy = 'ascending',
		layout_strategy = 'horizontal',
		layout_defaults = {
			horizontal = {
				mirror = false,
			},
			vertical = {
				mirror = false,
			},
		},
		shorten_path = true,
		use_less = true,
		set_env = {["COLORTERM"] = "truecolor"},
	}
}

local opts = { noremap = true }
vim.api.nvim_set_keymap('n', '<C-f>f', "<CMD>lua require('telescope.builtin').find_files({previewer = false})<CR>", opts)
vim.api.nvim_set_keymap('n', '<C-f>g', "<CMD>lua require('telescope.builtin').live_grep()<CR>", opts)
vim.api.nvim_set_keymap('n', '<C-f>b', "<CMD>lua require('telescope.builtin').file_browser()<CR>", opts)
vim.api.nvim_set_keymap('n', '<C-f>p', "<CMD>lua require('telescope.builtin').oldfiles()<CR>", opts)
vim.api.nvim_set_keymap('n', '<C-k><C-m>', "<CMD>lua require('telescope.builtin').keymaps()<CR>", opts)
