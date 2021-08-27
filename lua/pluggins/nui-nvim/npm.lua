local Menu = require('nui.menu')
local Input = require('nui.input')

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
			build_terminal('npm '..cmd:lower()..' '..val)
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
	return Menu(build_popup(), {
		lines = {
			Menu.item("Start"),
			Menu.item("Install"),
			Menu.item("Global Install"),
			Menu.item("Clean Install")
		},
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
			if value.text:find('Install') ~= nil then
				-- input then npm.cmd
				build_input(value.text)
			else
				build_terminal('npm '..value.text:lower())
			end
		end
	})
end

function Npm_commands()
	local menu = build_menu()
	menu:mount()
end

vim.api.nvim_set_keymap('n', '<leader>mp', "<cmd>lua Npm_commands()<cr>", { noremap = true, silent = true })
