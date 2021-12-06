-- ToggleTerma Setup
local wk = require('which-key')
local Terminal = require('toggleterm.terminal').Terminal
local lsp = require('plugins.lsp.config')
local shell = vim.o.shell

if lsp.isOS('windows') then
	shell = "bash"
end

require('toggleterm').setup{
	size = 17,
	hide_numbers = true,
	start_in_insert = false,
	direction = 'horizontal', -- vertical | float | tab
	persist_size = true,
	close_on_exit = true,
	shell = shell,
}

local lazygit = Terminal:new({
	cmd = 'lazygit',
	direction = 'tab',
	on_open = function(term)
		vim.cmd('startinsert!')
		vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>Close<CR>', { noremap = true, silent = true })
	end,
	on_close = function(_)
		vim.cmd(':NvimTreeRefresh<CR>')
	end,
})

function lazygit_toggle()
	lazygit:toggle()
end

local diff = Terminal:new({
	cmd = 'git diff',
	direction = 'tab',
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

