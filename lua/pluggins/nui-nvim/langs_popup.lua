local Menu = require('nui.menu')
local Input = require('nui.input')

function get_avail_langs()
	local path = os.getenv('VIMRUNTIME')..'\\syntax'
	local langs = io.popen('dir /b '..path)
	local names = {}
	local tLang = {}

	for lang in langs:lines() do
		table.insert(names, lang)
	end
	langs:close()

	for _, name in pairs(names) do
		local i, j = 1, 1
		name = string.upper(string.sub(name, 1, 1))..string.sub(name, 2)
		i = string.find(name, '.', 1, true)
		if i ~= nil then
			name = string.sub(name, 1, i - 1)
			j = string.find(name, 'script', 1, true)
			if j ~= nil then
			   local sub = string.upper(string.sub(name, j, j))..string.sub(name, j + 1)
			   name = string.sub(name, 1, j - 1)..sub
			end
		end
		if not string.match(name, '^[0-9]') then
			table.insert(tLang, Menu.item(name))
		end
	end

	table.sort(tLang, function(a, b)
		return a.text:upper() < b.text:upper()
	end)

	return tLang
end

function build_popup_options()
	local popup_options = {
		border = {
			style = "rounded",
			highlight = 'FloatBorder',
			text = {
				top = "Available Languages",
				top_align = "center"
			}
		},
		position = "50%",
		size = {
			width = 50,
			height = 20
		}
	}

	return popup_options
end

function nui_test()
	local input_options = {
		border = {
			style = "rounded",
			text = {
				top = "[SaveAs]",
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
			vim.cmd('saveas '..val)
			print('Save file!')
		end,
	})

	local menu = Menu(build_popup_options(), {
		lines = get_avail_langs(),
		max_width = 50,
		separator = {
			char = '-',
			text_align = "left"
		},
		keymap = {
			focus_next = {"j"},
			focus_prev = {"k"},
			close = {"<Esc>"},
			submit = {"<CR>"}
		},
		on_close = function ()
			print("Input closed!")
		end,
		on_submit = function (value)
			-- vim.cmd('set syntax='..value.text)

			--[[ input:mount()
			input:map('n', '<esc>', input.input_props.on_close, { noremap = true }) ]]
		end
	})
	menu:mount()
	input:mount()
	input:map('n', '<esc>', input.input_props.on_close, { noremap = true })
end

-- vim.api.nvim_set_keymap('n', '<leader>mp', "<cmd>:lua nui_test()<cr>", { noremap = true, silent = true })
