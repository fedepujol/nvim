-- ToggleTerma Setup

---@module "lazy"
---@type LazyPluginSpec
return {
	'akinsho/nvim-toggleterm.lua',
	keys = {
		{ '<leader>to', '<CMD>ToggleTerm<CR>', desc = '[t]erminal [o]pen' },
	},
	config = function()
		local utils = require('utils')
		local newShell = vim.o.shell

		if utils.is_windows() then
			newShell = 'powershell'
		end

		local toggleterm = require('toggleterm')
		toggleterm.setup({
			start_in_insert = false,
			direction = 'tab', -- vertical | float | tab
			open_mapping = '<leader>to',
			insert_mapping = false,
			shell = newShell,
		})

		vim.keymap.set('n', '<leader>tt', toggleterm.toggle, { desc = '[t]erminal [t]oggle' })
		vim.keymap.set('n', '<leader>ts', ':TermSelect<CR>', { desc = '[t]erminal [s]elect' })
		-- vim.keymap.set('n', '<leader>to', toggleterm.new, { desc = '[t]erminal [o]pen' })
	end,
}
