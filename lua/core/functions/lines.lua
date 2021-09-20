-- Usefull Functions
-- Log Levels: trace, debug, info, warn, error (0..4)
local wk = require('which-key')
DOWN = -1
UP = 1

-- Contains
-- tab: table of values
-- val: value to check if exists
-- return boolean
function Contains(tab, val)
	for _, value in ipairs(tab) do
		if val == value then
			return true
		end
	end
	return false
end

-- Move
-- cursor: position of cursor in the form of {line, col}
-- start_pos: position to get the lines. Cero indexed
-- end_pos: position to end the line. Cero indexed
-- dir: direction of the movement
function Move(cursor, start_pos, end_pos, dir)
	local cursor_line = cursor[1]
	local current_line = nil
	local target_line = nil

	current_line = vim.api.nvim_get_current_line()
	target_line = vim.api.nvim_buf_get_lines(0, start_pos, end_pos, true)

	-- Swap current with target
	if dir > 0 then
		vim.api.nvim_buf_set_lines(0, start_pos, end_pos, true, { current_line })
		vim.api.nvim_buf_set_lines(0, end_pos, cursor_line, true, target_line)
		else if dir < 0 then
			vim.api.nvim_buf_set_lines(0, start_pos - 1, end_pos - 1, true, target_line)
			vim.api.nvim_buf_set_lines(0, start_pos, end_pos, true, { current_line })
		end
	end
	-- Set cursor position
	vim.api.nvim_win_set_cursor(0, { end_pos, cursor[2] })
end

function MoveLine(direction)
	-- Get the last line of current buffer
	local last_line = vim.fn.line('$')

	-- Get current cursor position
	local cursor_position = vim.api.nvim_win_get_cursor(0)
	local line = cursor_position[1]
	local valid_directions = {'j', 'k'}
	local res = nil

	if direction == nil then
		vim.api.nvim_notify('Missing direction', 4, {})
		return
	end

	res = Contains(valid_directions, direction)

	if res == nil or not res then
		vim.api.nvim_notify('Invalid direction', 4, {})
		return
	end

	-- Edge Case
	if line == 1 and direction == 'j' then
		Move(cursor_position, line, line + 1, DOWN)
		return
	end
	if line == last_line and direction == 'k' then
		Move(cursor_position, line - 2, line -1, UP)
		return
	end

	-- General Case
	if line > 1 and line < last_line then
		if direction == 'j' then
			Move(cursor_position, line, line + 1, DOWN)
			return
		end
		if direction == 'k' then
			Move(cursor_position, line - 2, line - 1, UP)
			return
		end
	end
end

-- RemoveEmptyLines
-- Removes all empty lines from a range seleciton
-- select_begin: line number of first selected line
-- select_end: line number of current cursor position
-- selection: selected range from select_begin to select_end
function RemoveEmptyLines()
	local select_begin = nil
	local select_end = nil
	local selection = nil
	local new_selection = {}

	select_begin = vim.fn.line('v')
	select_end = vim.api.nvim_win_get_cursor(0)[1]
	selection = vim.api.nvim_buf_get_lines(0, select_begin -1, select_end, true)

	for _, value in ipairs(selection) do
		if value ~= "" then
			table.insert(new_selection, value)
		end
	end

	vim.api.nvim_buf_set_lines(0, select_begin -1, select_end, true, new_selection)
	vim.api.nvim_win_set_cursor(0, { select_begin, 0 })
end


wk.register({
	f = {
		l = {
			name = "Lines",
			u = {"<cmd>lua MoveLine('k')<CR>", "Move line up"},
			d = {"<cmd>lua MoveLine('j')<CR>", "Move line down"},
		}
	}
}, { mode = 'n', prefix = '<leader>', noremap = true, silent = true })
