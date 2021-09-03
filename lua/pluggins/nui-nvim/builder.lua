local Menu = require('nui.menu')
local Input = require('nui.input')

local Builder = { cmds = {} }

function Builder:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	self.cmds = o.cmds
	return o
end

function Builder:findCmd(desc)
	local cmd = nil

	for _, value in pairs(Builder.cmds) do
		for _, val in ipairs(value) do
			if val.menu:lower() == desc:lower() then
				cmd = val.cmd
			end
		end
	end

	return cmd
end

function Builder:spawn_terminal(cmd)
	local path = vim.cmd('pwd')
	vim.cmd('15split new')
	vim.fn.termopen(cmd, { cwd = path })
	vim.cmd('startinsert!')
end

function Builder:build_popup()
	return {
		border = {
			style = "rounded",
			highlight = "Normal:Normal",
			text = {
				top = "Select Command",
				top_align = "center"
			}
		},
		position = "50%",
		size = {
			height = 20,
			width = 50
		}
	}
end

function Builder:build_input_opts()
	return {
		border = {
			style = "rounded",
			text = {
				top = "[Install]",
				top_align = "left"
			},
		},
		position = "50%",
		size = {
			width = 80,
			height = 3
		}
	}
end


function Builder:build_input(desc)
	local input = Input(Builder:build_input_opts(), {
		prompt = "> ",
		default_value = '',
		on_submit = function(val)
			local cmd = Builder:findCmd(desc)
			Builder:spawn_terminal(cmd..val)
		end,
	})
	input:mount()
end

function Builder:build_menu()
	local lines_tab = {}
	local c_tab = {}

	for index, value in pairs(Builder.cmds) do
		table.insert(lines_tab, Menu.separator(string.sub(index, 1, 1):upper()..string.sub(index, 2)))
		for _, val in ipairs(value) do
			table.insert(lines_tab, Menu.item(val.menu))
		end
	end

	for idx, value in pairs(Builder.cmds) do
		table.insert(c_tab, value.eval)
		for _, val in ipairs(value) do
			table.insert(val, idx)
			table.insert(c_tab, val)
		end
	end

	return Menu(Builder:build_popup(), {
		lines = lines_tab,
		separator = {
			char = '-',
			text_align = 'center',
		},
		max_width = 20,
		keymap = {
			focus_next = {"j"},
			focus_prev = {"k"},
			close = {"<ESC>"},
			submit = {"<CR>"}
		},
		on_close = function()
			vim.api.nvim_notify('Selection cancelled', 2, {})
		end,
		on_submit = function(value)
			local index = value._index
			local eval_index = c_tab[index][1]
			local eval = Builder.cmds[eval_index].eval
			if eval(value.text) then
				Builder:build_input(value.text)
			else
				local cmd = Builder:findCmd(value.text)
				Builder:spawn_terminal(cmd)
			end
		end
	})
end

return Builder
