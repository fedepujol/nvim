-- Fidget.nvim

require('fidget').setup({
	text = {
		spinner = 'dots',
		done = 'Done',
		commenced = 'Started',
		completed = 'Completed',
	},
	align = {
		bottom = true,
		right = true,
	},
	timer = { -- Time units in ms
		spinner_rate = 60, -- FPS for spinner animation
		fidget_decay = 2000, -- Time to keep empty fidget in ms
		task_decay = 1000, -- Time to keep completed task
	},
	window = {
		relative = 'win', -- Where to anchor (window or editor)
		blend = 100, -- &winblend for win option
		zindex = nil, -- zindex value for window
	},
	fmt = {
		leftpad = true, -- right-justified text in fidget
		stack_upwards = true, -- list of tasks grows upwards
		max_width = 0, -- maximum width of the figdet box
		fidget = function(name, spinner)
			return string.format('%s %s', spinner, name)
		end,
		task = function(name, message, percentage)
			return string.format('%s%s [%s]', message, percentage and string.format(' (%s%%)', percentage) or '', name)
		end,
	},
	debug = {
		logging = false,
	},
})
