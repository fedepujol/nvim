-- BetterEscape
return {
	'max397574/better-escape.nvim',
	event = 'InsertEnter',
	config = function()
		require('better_escape').setup({
			mapping = { 'jk' }, -- Table mappings to use
			timeout = vim.o.timeoutlen, -- Time in which the keys must be hit. Defaults to timeoutlen
			clear_empty_lines = true, -- Clears the line if there is only whitespaces
			keys = '<ESC>', -- Keys used for escaping. Could be a function
		})
	end,
}
