-- BetterEscape
return {
	'max397574/better-escape.nvim',
	event = 'InsertEnter',
	config = function()
		require('better_escape').setup({
			default_mappings = false,
			timeout = vim.o.timeoutlen,
			mappings = {
				i = {
					j = {
						k = '<ESC>',
					},
					J = {
						K = '<ESC>',
					},
				},
			},
		})
	end,
}
