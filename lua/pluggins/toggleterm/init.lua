-- ToggleTerma Setup
local wk = require('which-key')

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

vim.api.nvim_set_keymap('n', '<leader>t', "<cmd>:ToggleTerm<CR>", {noremap = true, silent = true})

local Terminal = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new({
	cmd = 'lazygit',
	direction = 'float',
	float_opts = {
		border = 'single',
		width = 150,
		height = 40,
		winblend = 3,
		highlights = {
			border = 'Normal',
			background = 'Normal'
		}
	},
	on_open = function(term)
		vim.cmd('startinsert!')
		vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>Close<CR>', {noremap = true, silent = true})
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
		n = {'<cmd>:ToggleTerm<CR>', "Toggle Term"}
	},
	g = {
		l = {'<cmd>lua lazygit_toggle()<CR>', 'Lazygit'}
	}
}, {mode = 'n', prefix = '<leader>', noremap = true, silent = true})

