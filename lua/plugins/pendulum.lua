return {
	'ptdewey/pendulum-nvim',
	lazy = false,
	config = function()
		require('pendulum').setup({
			log_file = vim.fn.expand("$HOME/Documents/pendulum-nvim_log.csv"),
			gen_reports = false,
		})
	end,
}
