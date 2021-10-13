local Menu = require('nui.menu')

local langs = {
	{text = 'basic'},
	{text = 'c'},
	{text = 'haskell'},
	{text = 'java'},
	{text = 'javascript'},
	{text = 'lua'},
	{text = 'prolog'},
	{text = 'sh'},
	{text = 'sql'},
	{text = 'typescript'},
}

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
	local lin = {}

	for _, value in pairs(langs) do
		print(value)
		table.insert(lin, Menu.item(value))
	end

	local menu = Menu(build_popup_options(), {
		lines = lin,
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
			vim.cmd('set syntax='..value.text)
		end
	})

	menu:mount()
end

vim.api.nvim_set_keymap('n', '<leader>mp', "<cmd>:lua nui_test()<cr>", { noremap = true, silent = true })
