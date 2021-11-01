local wk = require('which-key')

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
		layout_strategy = 'horizontal',
		layout_config = {
			prompt_position = 'top',
			horizontal = {
				mirror = false,
			},
			vertical = {
				mirror = false,
			},
			preview_width = 110
		},
		path_display = {
			shorten = 4,
		},
		use_less = true,
		file_ignore_patterns = {'./node_modules'},
		set_env = {["COLORTERM"] = "truecolor"},
	}
}

local opts = { noremap = true }

-- File Search
vim.api.nvim_set_keymap('n', '<C-p>', "<CMD>lua require('telescope.builtin').find_files({previewer = false})<CR>", opts)

wk.register({
	name = 'Find',
	b = {'<cmd>lua require("telescope.builtin").buffers()<CR>', 'Buffers'},
	o = {'<cmd>lua require("telescope.builtin").oldfiles()<CR>', 'Old files'},
	g = {'<cmd>lua require("telescope.builtin").live_grep()<CR>', 'Live Grep'},
	h = {'<cmd>lua require("telescope.builtin").help_tags()<CR>', 'Help Tags'},
}, { mode = 'n', prefix = '<C-f>', noremap = true, silent = true })
