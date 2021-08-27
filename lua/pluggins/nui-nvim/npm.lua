local Menu = require('nui.menu')
local Input = require('nui.input')

local Npm = {
	start = { id = 1, cmd = 'npm start', menu = 'Start'},
	inst = { id = 2, cmd = 'npm i ', menu = 'Install'},
	dev_inst = { id = 3, cmd = 'npm i --dev ', menu = 'Dev Install'},
	global_inst = { id = 4, cmd = 'npm i -g ', menu = 'Global Install'},
	uninst = { id = 5, cmd = 'npm un ', menu = 'Uninstall'},
	globa_uninst = { id = 6, cmd = 'npm un -g ', menu = 'Global Uninstall'},
	clean_inst = { id = 7, cmd = 'npm clean-install', menu = 'Clean Install'}
}

function OnExit(_, code)
	print(vim.inspect(code))
	vim.notify("Hello")
end

function build_terminal(cmd)
	local path = vim.cmd('pwd')
	vim.cmd('15split new')
	vim.fn.termopen(cmd, {cwd = path, on_exit = OnExit })
end

function build_input(cmd)
	local input_options = {
		border = {
			style = "rounded",
			text = {
				top = "[NPM]",
				top_align = "left"
			},
		},
		position = "50%",
		size = {
			width = 80,
			height = 3
		}
	}

	local input = Input(input_options, {
		prompt = "> ",
		default_value = '',
		on_submit = function(val)
			build_terminal(cmd.cmd..val)
		end,
	})
	input:mount()
end

function build_popup()
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

function build_menu()
	local values = vim.tbl_values(Npm)
	local tab = {} 

	for	index, value in ipairs(values) do
		table.insert(tab, index, Menu.item(value.menu))
	end

	print(vim.inspect(tab))
	return Menu(build_popup(), {
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
			print("Input closed")
		end,
		on_submit = function(value)
			print(vim.inspect(value))
			if value.text:find('Install') ~= nil and value.text:find('Clean') == nil then
				build_input(Npm[value._index])
			else
				build_terminal(Npm[value._index].cmd)
			end
		end
	})
end

function Npm_commands()
	local menu = build_menu()
	menu:mount()
end

vim.api.nvim_set_keymap('n', '<leader>mp', "<cmd>lua Npm_commands()<cr>", { noremap = true, silent = true })
