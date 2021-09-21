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
		if vim.fn.mode():byte() == 86 or vim.fn.mode():byte() == 118 then
            local vSRow = vim.fn.line('v')
			local vERow= vim.api.nvim_win_get_cursor(0)[1]
            vim.api.nvim_buf_set_text(0, vSRow - 1, 0, vERow, 0, {''})
			--[[ local select_begin = vim.fn.line('v')
			local select_end = vim.api.nvim_win_get_cursor(0)[1]
			if select_begin > select_end then
				local aux = select_begin
				select_begin = select_end
				select_end = aux
			end
			local vBlock = vim.api.nvim_buf_get_lines(0, select_begin - 1, select_end, true)
			local vTarget = vim.api.nvim_buf_get_lines(0, select_begin - 2, select_begin - 1, true)

			print("Empty lines range", select_begin - 2, select_end - 1)
			print("Insert block range", select_begin - 2, select_end - 2)
			print("Insert line range", select_end - 1, select_end - 1)

			vim.api.nvim_buf_set_lines(0, select_begin - 2, select_end, true, {''})
			vim.api.nvim_buf_set_lines(0, select_begin - 2, select_end - 2, true, vBlock)
			vim.api.nvim_buf_set_lines(0, select_end - 1, select_end - 1, true, vTarget)
			vim.api.nvim_exec(":normal! "..(select_begin - 1).."ggV"..(select_end - 1).."gg", false) ]]
		else
			vim.api.nvim_buf_set_lines(0, start_pos, end_pos, true, { current_line })
			vim.api.nvim_buf_set_lines(0, end_pos, cursor_line, true, target_line)
		end
		else if dir < 0 then
			if vim.fn.mode():byte() == 86 or vim.fn.mode():byte() == 118 then
				local select_begin = vim.fn.line('v')
				local select_end = vim.api.nvim_win_get_cursor(0)[1]
				local vBlock = vim.api.nvim_buf_get_lines(0, select_begin -1, select_end, true)
				print(vim.inspect(vBlock))
				--[[ vim.api.nvim_buf_set_lines(0, start_pos - 1, end_pos - 1, true, target_line)
				vim.api.nvim_buf_set_lines(0, end_pos, cursor_line, true, { vBlock }) ]]
			else
				vim.api.nvim_buf_set_lines(0, start_pos - 1, end_pos - 1, true, target_line)
				vim.api.nvim_buf_set_lines(0, start_pos, end_pos, true, { current_line })
			end
		end
	end
	-- Set cursor position
	-- vim.api.nvim_win_set_cursor(0, { end_pos, cursor[2] })
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

vim.api.nvim_set_keymap('n', '<C-A-k>', "<Cmd>lua MoveLine('k')<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-A-j>', "<Cmd>lua MoveLine('j')<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-A-k>', "<Cmd>lua MoveLine('k')<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-A-j>', "<Cmd>lua MoveLine('j')<CR>", { noremap = true, silent = true })

wk.register({
	f = {
		l = {
			name = "Lines",
			u = {"<cmd>lua MoveLine('k')<CR>", "Move line up"},
			d = {"<cmd>lua MoveLine('j')<CR>", "Move line down"},
		}
	}
}, { mode = 'n', prefix = '<leader>', noremap = true, silent = true })
