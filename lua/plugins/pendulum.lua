return {
	'ptdewey/pendulum-nvim',
	event = "InsertEnter",
	config = function()
		require('pendulum').setup({
			log_file = vim.fn.expand("$HOME/Documents/pendulum-nvim_log.csv"),
			gen_reports = false,
		})
	end,
}
