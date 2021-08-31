local Menu = require('nui.menu')
local Input = require('nui.input')

local Builder = { cmds = {}, eval = '', title = '' }

function Builder:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	self.cmds = o.cmds 
	self.eval = o.eval 
	self.title = o.title 
	return o 
end

function Builder:findCmd(desc)
	local cmd = nil
	local tbl = vim.tbl_values(self.cmds)

	for _, value in ipairs(tbl) do
		if value.menu:lower() == desc:lower() then
			cmd = value.cmd
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
				top = "["..self.title.."]",
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
	local tab = {}

	for	_, value in pairs(Builder.cmds) do
		table.insert(tab, Menu.item(value.menu))
	end

	return Menu(Builder:build_popup(), {
		lines = tab,
		separator = {
			char = '-',
			text_align = 'left',
		},
		max_width = 20,
		keymap = {
			focus_next = {"j"},
			focus_prev = {"k"},
			close = {"<ESC>"},
			submit = {"<CR>"}
		},
		on_close = function()
			vim.api.nvim_notify('Selection cancelled', 3, {})
		end,
		on_submit = function(value)
			if value.text:find(Builder.eval) ~= nil then
				Builder:build_input(value.text)
			else
				local cmd = Builder:findCmd(value.text)
				Builder:spawn_terminal(cmd)
			end
		end
	})
end

return Builder
