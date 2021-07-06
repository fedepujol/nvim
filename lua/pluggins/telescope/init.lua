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
		prompt_prefix = '~ ',
		selection_caret = '> ',
		sorting_strategy = 'ascending',
		layout_strategy = 'vertical',
		layout_config= {
			prompt_position = 'top',
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
-- File Search
vim.api.nvim_set_keymap('n', '<C-p>', "<CMD>lua require('telescope.builtin').find_files({previewer = false})<CR>", opts)
vim.api.nvim_set_keymap('n', '<C-f>b', "<CMD>lua require('telescope.builtin').buffers()<CR>", opts)
vim.api.nvim_set_keymap('n', '<C-f>o', "<CMD>lua require('telescope.builtin').oldfiles()<CR>", opts)
-- Word Search
vim.api.nvim_set_keymap('n', '<C-f>g', "<CMD>lua require('telescope.builtin').live_grep()<CR>", opts)
vim.api.nvim_set_keymap('n', '<C-f>h', "<CMD>lua require('telescope.builtin').help_tags()<CR>", opts)
vim.api.nvim_set_keymap('n', '<C-f>c', "<CMD>lua require('telescope.builtin').grep_string()<CR>", opts)
-- KeyMaps Search
vim.api.nvim_set_keymap('n', '<C-f>k', "<CMD>lua require('telescope.builtin').keymaps()<CR>", opts)

