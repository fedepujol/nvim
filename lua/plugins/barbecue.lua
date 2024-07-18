return {
	'utilyre/barbecue.nvim',
	name = 'barbecue',
	event = 'LspAttach',
	dependencies = {
		'SmiteshP/nvim-navic',
	},
	config = function()
		require('barbecue').setup({
			create_autocmd = false,
		})

		vim.api.nvim_create_autocmd({
			'WinResized', -- or WinResized on NVIM-v0.9 and higher
			'BufWinEnter',
			'CursorHold',
			'InsertLeave',
		}, {
			group = vim.api.nvim_create_augroup('barbecue.updater', {}),
			callback = function()
				require('barbecue.ui').update()
			end,
		})
	end,
}
