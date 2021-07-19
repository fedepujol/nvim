-- GitSigns
require('gitsigns').setup {
	signs = {
		add          = {hl = 'GitSignsAdd'   , text = '│' },
		change       = {hl = 'GitSignsChange', text = '│' },
		delete       = {hl = 'GitSignsDelete', text = '>' },
		topdelete    = {hl = 'GitSignsDelete', text = '‾' },
		changedelete = {hl = 'GitSignsChange', text = '~' },
	},
	numhl = false,
	linehl = false,
	watch_index = {
		interval = 1000
	},
	current_line_blame = true,
	current_line_blame_position = 'eol',
	current_line_blame_formatter = function(name, blame_info, opts)
		if blame_info.author == name then
			blame_info.author = 'You'
		end

		local text = ''
		local date_time

		if blame_info.author == 'Not Committed Yet' then
			blame_info.author = 'You'
			blame_info.summary = 'Not Committed Yet'
		end

		if opts.relative_time then
			date_time = require('gitsigns.util').get_relative_time(tonumber(blame_info['author_time']))
		else
			date_time = os.date('%Y-%m-%d', tonumber(blame_info['author_time']))
		end

		text = string.format('%s, %s - %s', blame_info.author, date_time, blame_info.summary)

		return {{' '..text, 'GitSignsCurrentLineBlame'}}
	end,
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	use_decoration_api = true,
}
