-- Fzf Extended
--
return {
	'linrongbin16/fzfx.nvim',
	event = 'VimEnter',
	keys = {
		{
			'<leader>fp',
			'<cmd>FzfxFiles<CR>',
			desc = 'Find Files',
		},
		{
			'<leader>fg',
			'<cmd>FzfxLiveGrep<CR>',
			desc = 'Live Grep',
		},
	},
	dependencies = {
		{
			'junegunn/fzf',
			build = function()
				vim.fn['fzf#install']()
			end,
		},
	},
	config = function()
		require('fzfx').setup({
			files = {
				fzf_opts = {
					'--preview-window=hidden',
				},
			},
		})
	end,
}
