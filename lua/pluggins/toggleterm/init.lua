-- ToggleTerma Setup
local wk = require('which-key')
local Terminal = require('toggleterm.terminal').Terminal

require('toggleterm').setup{
	size = 15,
	hide_numbers = true,
	start_in_insert = false,
	direction = 'horizontal', -- vertical | float | window
	persist_size = true,
	close_on_exit = true,
	shell = "bash",
	float_opts = {
		border = "rounded",
		width = 150,
		height = 40,
		winblend = 3,
		highlights = {
			border = "Normal",
			background = "Normal"
		}
	}
}

local lazygit = Terminal:new({
	cmd = 'lazygit',
	direction = 'window',
	on_open = function(term)
		vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>Close<CR>', { noremap = true, silent = true })
	end,
	on_close = function(term)
		print('LayGit Finished')
	end,
})

function lazygit_toggle()
	lazygit:toggle()
end

wk.register({
	t = {
		name = "Terminal",
		i = {'<cmd>:ToggleTerm<CR>', "New/Toggle Term"},
	},
	g = {
		l = {'<cmd>lua lazygit_toggle()<CR>', 'Lazygit'}
	}
}, {mode = 'n', prefix = '<leader>', noremap = true, silent = true})

