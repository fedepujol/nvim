-- ToggleTerma Setup
local wk = require('which-key')
local Terminal = require('toggleterm.terminal').Terminal
local lsp = require('plugins.lsp.config')
local shell = vim.o.shell

if lsp.isOS('windows') then
	shell = "bash"
end

require('toggleterm').setup{
	size = 15,
	hide_numbers = true,
	start_in_insert = false,
	direction = 'horizontal', -- vertical | float | window
	persist_size = true,
	close_on_exit = true,
	shell = shell,
}

local lazygit = Terminal:new({
	cmd = 'lazygit',
	direction = 'float',
	float_opts = {
		border = "rounded",
		width = 150,
		height = 40,
		winblend = 3,
		highlights = {
			border = "Normal",
			background = "Normal"
		}
	},
	on_open = function(term)
		vim.cmd('startinsert!')
		vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>Close<CR>', { noremap = true, silent = true })
	end,
	on_close = function(_)
		local nvtree = require('nvim-tree')
		nvtree.refresh()
		print('LayGit Finished')
	end,
})

function lazygit_toggle()
	lazygit:toggle()
end

local diff = Terminal:new({
	cmd = 'git diff',
	direction = 'float',
	float_opts = {
		border = "rounded",
		width = vim.api.nvim_win_get_width(0),
		height = vim.api.nvim_win_get_height(0),
		winblend = 3,
		highlights = {
			border = "Normal",
			background = "Normal"
		}
	},
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', 'q', {noremap = true, silent = true })
	end,
	on_close = function(_)
		print('Finished')
	end,
})

function diff_toggle()
	diff:toggle()
end

wk.register({
	t = {
		name = "Terminal",
		i = {'<cmd>:ToggleTerm<CR>', "New/Toggle Term"},
	},
	g = {
		l = {'<cmd>lua lazygit_toggle()<CR>', 'Lazygit'},
		d = {'<cmd>lua diff_toggle()<CR>', 'DiffView'}
	}
}, {mode = 'n', prefix = '<leader>', noremap = true, silent = true})

