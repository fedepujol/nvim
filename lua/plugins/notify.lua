return {
	event = 'VeryLazy',
	'rcarriga/nvim-notify',
	config = function()
		require('notify').setup({
			fps = 60,
			max_height = 360,
			max_width = 250,
			minimum_width = 100,
			render = "wrapped-compact",
			timeout = 200,
			top_down = false,
		})

		vim.notify = require('notify')
	end
}
