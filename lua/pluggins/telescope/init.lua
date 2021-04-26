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
		set_env = {["COLORTERM"] = "truecolor"},
	}
}
