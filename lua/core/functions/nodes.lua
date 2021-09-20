-- Move Nodes using Treesitter
local ts_utils = require('nvim-treesitter.ts_utils')
local wk = require('which-key')

local function get_cur_node()
	local node = ts_utils.get_node_at_cursor()
	if node == nil then
		error('No Treesitter module found')
	end

	return node
end

local function get_parent_node()
	local node = get_cur_node()
	local start_row = node:start()
	local parent = node:parent()
	local root_node = ts_utils.get_root_for_node(node)

	if parent ~= nil then
		while parent:start() == start_row and parent ~= root_node do
			node = parent
			parent = node:parent()
		end
	end
	return node
end

function Up()
	local cur_node = get_parent_node()
	local prev = ts_utils.get_previous_node(cur_node, false, false)
	local buffnr = vim.api.nvim_get_current_buf()

	ts_utils.swap_nodes(cur_node, prev, buffnr, true)
end

function Down()
	local cur_node = get_parent_node()
	local next = ts_utils.get_next_node(cur_node, false, false)
	local buffnr = vim.api.nvim_get_current_buf()

	ts_utils.swap_nodes(cur_node, next, buffnr, true)
end

function Select()
	local cur_node = get_parent_node()
	local buffnr = vim.api.nvim_get_current_buf()

	ts_utils.update_selection(buffnr, cur_node)
end

function Delete()
	local cur_node = get_parent_node()
	local buffnr = vim.api.nvim_get_current_buf()
	local srow, scol, erow, ecol = cur_node:range()

	vim.api.nvim_buf_set_text(buffnr, srow, scol, erow, ecol, { '' })
end


wk.register({
	f = {
		n = {
			name = "Nodes",
			u = {"<cmd>lua Up()<CR>", "Move node up"},
			d = {"<cmd>lua Down()<CR>", "Move node down"},
			s = {"<cmd>lua Select()<CR>", "Select node"},
			x = {"<cmd>lua Delete()<CR>", "Delete Node"},
		}
	}
}, { mode = 'n', prefix = '<leader>', noremap = true, silent = true })

